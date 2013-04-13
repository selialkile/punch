require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)

module Punch
	class Client
		include Connection
		include Request
	end
end