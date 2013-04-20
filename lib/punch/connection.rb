# -*- encoding : utf-8 -*-
require 'faraday'
#require File.expand_path('../configuration', __FILE__)

module Punch
	module Connection
		private
		def connection(raw=false)
			options={
				:url => Configuration::DEFAULT_ENDPOINT
			}
			::Faraday::Connection.new(options) do |c|
			  c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
			  c.use Faraday::Response::Logger     # log request & response to STDOUT
			  c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
			  #c.use FaradayMiddleware::Mashify unless raw
			  #c.use Faraday::Response::ParseJson
			end
		end
		
	end
end