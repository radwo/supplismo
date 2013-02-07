unless $LOAD_PATH.include? "."
  $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
end

require File.dirname(__FILE__) + '/config/boot.rb'

run Provider::App
