require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra/base'
require 'sinatra/json'
require 'data_mapper'
require 'rspec'
require 'rack/test'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

Dir["./app/**/*.rb"].each { |f| require f }

DataMapper.setup(:default, "sqlite3::memory:")

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) { DataMapper.auto_migrate! }
end
