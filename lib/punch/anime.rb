require 'open-uri'
module Punch
	class Anime
		ANIME_LIST = 'http://www.punchsub.com/lista-de-animes/nome/todos/'
		attr_accessor :name, :url, :picture

		def initialize name, url, picture
			@name, @url, @picture = name,url, picture
		end

		def self.all
			animes = []
			1.upto(total_pages).each do |page_number|
				doc = Nokogiri::HTML(open(ANIME_LIST+page_number.to_s))

				doc.css(".projetosListagem ul li").each do |node|
					animes.push( Anime.new(node.search(".pNome").text, node.search(".pNome a").first["href"],node.search(".projetoImg img").first['src']) )
				end
			end
			animes
		end

		private
		def self.total_pages
			doc = Nokogiri::HTML(open(ANIME_LIST+"1"))
			doc.css(".paginacao li").map{|node| node.text.to_i}.max
		end
	end
end