require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('./lib/**/*.rb')
require './lib/Mrfluffles'

get ('/') do
  @list = Mrfluffles.all
  erb(:index)
end

post('/') do
  name = params["name"]
  new_cat = Mrfluffles.new(name)
  new_cat.save
  @list = Mrfluffles.all
  erb(:index)
end

get('/details/:id') do
  @cat = Mrfluffles.find(params[:id])
  erb(:details)
end
