require 'sinatra'
require_relative "./addressbook"

ADDRESSBOOK = Addressbook.new
ADDRESSBOOK.put('Ololosha', 'Somestreet, 256')
ADDRESSBOOK.put('Nyasha', 'Someother street, 64')

get '/' do
  erb :index
end

get '/person/:name' do   
  name = params[:name]
  address = ADDRESSBOOK.get(name)

  erb :person, locals: {name: name, address: address}
end