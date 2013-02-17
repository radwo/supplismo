ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/json'
require "sinatra/reloader"
require 'data_mapper'

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./app/**/*.rb"].each { |f| require f }
