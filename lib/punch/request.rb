# -*- encoding : utf-8 -*-
require 'json'
module Punch
	#Defines HTTP request methods
	module Request
		#Perform HTTP GET request
		def get(path, options={}, raw=false)
			request(:get, path, options, raw)
		end

		#Perform HTTP POST request
		def post(path, options={}, raw=false)
			request(:post, path, options, raw)
		end
		
		private
		def request(method, path, options, raw=false)
			response = connection(raw).send(method) do |request|
				case method
				when :get
					request.url(path, options)
				when :post
					request.headers['Content-Type'] = Faraday::Request::UrlEncoded::mime_type #'application/x-www-form-urlencoded'
					request.path = path
					request.body = URI.encode_www_form(options) unless options.empty?
				end
			end
			return response if raw
			return response.body
		end
	end
end