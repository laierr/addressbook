ENV['RACK_ENV'] = 'test'

require_relative "../lib/addressbook"
require_relative "../lib/app"

require 'rack/test'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.include Capybara::DSL
end