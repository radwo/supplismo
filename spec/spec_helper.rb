ENV["RACK_ENV"] = "test"
require File.join(File.dirname(__FILE__), '../app/application')

require 'rspec'
require 'rack/test'

Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

DataMapper.setup(:default, "sqlite3::memory:")

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) { DataMapper.auto_migrate! }
end
