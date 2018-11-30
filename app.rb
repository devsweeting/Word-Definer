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
  erb(:index)
end

get ('/addword') do
  erb(:addword)
end

post('/addword') do
  word = params["user_word"]
  definition = params["user_definition"]
  new_word = Word.new({:word => word, :definition => definition})
  @dictionary = new_word.save
  @dictionary = Word.all
  erb(:index)
end

get('/output/:id') do
  uid = params[:id].to_i
  @word = Word.find(uid)
  erb(:output)
end

# Cannot delete correct word, ID comes back 0 in pry, FRANZ I NEED HELP DURING CHECK IN
delete ("/output/:id") do
  id = params[:id].to_i
  binding.pry
  @word = Word.delete_content(id)
  binding.pry
  redirect "/"
end
# -----------------------------------
