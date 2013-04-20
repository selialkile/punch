# -*- encoding : utf-8 -*-
require 'pry'
require 'nokogiri'
require 'yaml'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'punch/anime'
require 'punch/client'

module Punch

  class << self
  	def client
      client = Punch::Client.new
      user = self.config["user"] || ARGV[0]
      pass = self.config["pass"] || ARGV[1]
      Punch::Client.cookie = client.authenticate user, pass #Just for testing
      anime_list = Anime.all
  	end

      # Get or set email_api configuration from yaml
    def config(config_parsed=nil)
      @config ||= config_parsed || fetch_file("config.yml")
    end

    def base_directory
      File.expand_path(File.join(File.dirname(__FILE__),".."))
    end
      
    def lib_directory
      File.expand_path(File.dirname(__FILE__))
    end

    def env
      @env ||= ENV['RAILS_ENV'] || ENV['RUBY_ENV'] || 'development'
    end
    
    def env=(environment)
      @env = environment
    end
  end

  private
  
  def self.fetch_file(file_name)
    yaml = File.expand_path(File.join("#{base_directory}/config", file_name))
    puts yaml
    YAML.load_file(yaml)[env]
  end
end


Punch::client