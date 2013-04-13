require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require File.expand_path('../authentication', __FILE__)
require File.expand_path('../error', __FILE__)

module Punch
	class Client
		include Connection
		include Request
		include Authentication
	end
end