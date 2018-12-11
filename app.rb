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

# Add new word ----------
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
#  --------------------


# word page
get('/output/:id') do
  @uid = params[:id].to_i
  @word = Word.find(@uid)
  @dictionary = Word.all
  erb(:output)
end

# edit first definition
post ("/output/:id") do
  @uid = params[:id].to_i
  new_def = params.fetch("edit_def")
  @word = Word.find(@uid)
  @word.edit_def(new_def)
  @dictionary = Word.all
  erb(:output)
end

# Add a new definition
post ("/output/:id/add_def") do
  @uid = params[:id].to_i
  new_def = params.fetch("add_def")
  @word = Word.find(@uid)
  @word.add_def(new_def)
  @dictionary = Word.all
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
