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
					request.path = path
					request.body = options.to_json unless options.empty?
				end
			end
			return response if raw
			return response.body
		end
	end
end