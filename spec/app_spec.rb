require 'spec_helper'

describe App do
  include Rack::Test::Methods
  def app
    App
  end

  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should allow accessing personal page" do  
    name = 'Ololosha'
    get "/person/#{name}"
    expect(last_response).to be_ok
  end

  it 'creates new record' do
    expect {
      post '/', name: 'Doge', address: 'Wow'
    }.to change(App::ADDRESSBOOK, :list).to(App::ADDRESSBOOK.list + ['Doge'])
  end
end