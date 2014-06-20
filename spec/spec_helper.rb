ENV['RACK_ENV'] = 'test'

require_relative "../lib/addressbook"
require_relative "../lib/app"

require 'rack/test'

RSpec.configure do |config|
  
end