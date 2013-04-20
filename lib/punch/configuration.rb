# -*- encoding : utf-8 -*-
module Punch

	# Defines constants and methods related to configuration
	module Configuration

		VALID_OPTIONS_KEYS = [
	      :default_adapter,
	      :default_endpoint,
	      :cookie
	    ].freeze

	    # The adapter that will be used to connect if none is set
	    #
	    # @note The default faraday adapter is Net::HTTP.
		DEFAULT_ADAPTER = Faraday.default_adapter

		# The endpoint that will be used to connect if none is set
		DEFAULT_ENDPOINT = 'http://www.punchsub.com'.freeze

		ANIME_LIST = 'http://www.punchsub.com/lista-de-animes/nome/todos/'.freeze

		# @private
    	attr_accessor *VALID_OPTIONS_KEYS

    	# When this module is extended, set all configuration options to their default values
	    def self.extended(base)
	      	base.reset
	    end

	    def reset
	    	self.default_adapter  = DEFAULT_ADAPTER
	    	self.default_endpoint = DEFAULT_ENDPOINT
	    	self.cookie           = nil
	    end
	end
end