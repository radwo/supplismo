require 'rubygems'
require 'bundler'

Bundler.require

unless $LOAD_PATH.include? "."
  $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
end

set :environment, :development
require File.dirname(__FILE__) + '/config/boot.rb'

run Supplismo::App
