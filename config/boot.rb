ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/json'
require "sinatra/reloader" if development?
require 'data_mapper'

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
Dir["./app/**/*.rb"].each { |f| require f }
DataMapper.finalize.auto_upgrade!
