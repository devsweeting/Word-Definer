require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('./lib/**/*.rb')
require './lib/Word'

get ('/') do
  @list = Word.all
  erb(:index)
end

post('/') do
  word = params["user_word"]
  new_word = Word.new(word)
  new_word.save
  @word = Word.all
  erb(:index)
end

get('/details/:id') do
  @word = Word.find(params[:id])
  erb(:details)
end
