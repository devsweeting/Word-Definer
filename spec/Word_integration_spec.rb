require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words') do
    visit('/')
    expect(page).to have_content('Word Play')
  end
end

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words and displays theri definitions') do
    visit('/addword')
    fill_in('user_word', :with => 'test')
    fill_in('user_definition', :with => 'test words')
    click_button('Add')
    expect(page).to have_content("Word Play")
  end
end

# describe('the Word Definer', {:type => :feature}) do
#   it('will take the user to the add word page') do
#     visit('/')
#     click_button('Add New Word')
#     expect(page).to have_content("Add a New Word")
#   end
# end
#
# describe('the Word Definer', {:type => :feature}) do
#   it('will take the user to the word definition page') do
#     visit('/')
#     click_button('cat')
#     expect(page).to have_content("a small domesticated carnivorous mammal")
#   end
# end
