require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require 'data_mapper'

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./app/**/*.rb"].each { |f| require f }
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
DataMapper.finalize.auto_upgrade!
