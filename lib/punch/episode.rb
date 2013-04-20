module Punch
	class Episode
		attr_accessor :download_link, :number, :size, :resolution, :quality

		def self.all_from_anime url
			doc = Nokogiri::HTML(open(url))
			#TODO fetch epis
		end
	end
end