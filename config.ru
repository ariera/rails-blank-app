# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

require 'resque/server'
require 'resque/scheduler'
require 'resque/scheduler/server'

run Rack::URLMap.new("/" => Rails.application, "/resque" => Resque::Server.new)

#run Rails.application
