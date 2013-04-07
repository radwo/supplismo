require 'bundler'
Bundler.setup

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/reloader' if Sinatra::Base.development?
require 'data_mapper'

Bundler.require(:default, Sinatra::Base.environment)

Dir["./app/**/*.rb"].each { |f| require f }
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/#{Sinatra::Base.environment}.db")
DataMapper.finalize.auto_upgrade!
