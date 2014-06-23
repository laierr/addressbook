require 'spec_helper'

describe App do
  include Rack::Test::Methods
  def app
    App
  end

  Capybara.app = App

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

  describe 'form' do
    it "adds item to the book" do
      visit '/'

      name = "Olonyasha"
      address = "Ohnoes Street"

      within("form") do
        fill_in 'name', :with => name
        fill_in 'address', :with => address
      end
    
      click_button 'Submit'
      expect(page).to have_content name

      all('a').last.click
      expect(page).to have_content address
    end
  end
end