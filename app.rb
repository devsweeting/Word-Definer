require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('./lib/**/*.rb')
require './lib/Word'

get ('/') do
  if Word.all == []
    Word.add_dictionary
  end
  @dictionary = Word.all
  binding.pry
  erb(:index)
end

post('/') do
  word = params["user_word"]
  definition = params["user_definition"]
  new_word = Word.new({:word => word, :definition => definition})
  @dictionary = new_word.save
  @dictionary = Word.all
  erb(:index)
end

get('/details/:id') do
  @word = Word.find(params[:id])
  erb(:details)
end
