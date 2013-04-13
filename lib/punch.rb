require File.expand_path('../punch/client', __FILE__)
require 'pry'

module Punch
	def self.client
		Punch::Client.new
	end
end


Punch::client