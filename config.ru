require File.dirname(__FILE__) + '/config/environment'

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/#{Sinatra::Base.environment}.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)

run Supplismo::App
