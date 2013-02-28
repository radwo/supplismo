require 'rack/test'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'

ENV['RACK_ENV'] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

def app
  Rack::Builder.parse_file('config.ru').first
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/demo_test.db")
  DataMapper.finalize
  DataMapper.auto_migrate!
end
