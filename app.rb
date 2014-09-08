require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'


get '/' do
  @page = (params[:page]).to_i

  if @page == nil || @page < 1
    @page = 1
  end

  @contacts = Contact.all#.limit(3).offset(@page * 3 - 3)

  erb :index
end


get '/contacts/:id' do
  @contact_ids = Contact.all.find(params[:id])

  erb :show
end
