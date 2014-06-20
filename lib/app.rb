require 'sinatra/base'
require_relative "./addressbook"

class App < Sinatra::Base
  ADDRESSBOOK = Addressbook.new
  ADDRESSBOOK.put('Ololosha', 'Somestreet, 256')
  ADDRESSBOOK.put('Nyasha', 'Someother street, 64')

  get '/' do
    erb :index
  end

  post '/' do
    ADDRESSBOOK.put(params[:name], params[:address])
    redirect to('/')
  end

  get '/person/:name' do
    name = params[:name]
    address = ADDRESSBOOK.get(name)

    erb :person, locals: {name: name, address: address}
  end
end