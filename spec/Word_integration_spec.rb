require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words') do
    visit('/')
    # fill_in('length', :with => '5')
    # fill_in('width', :with => '5')
    # click_button('Go!')
    expect(page).to have_content('Word Play')
  end
end

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words and displays theri definitions') do
    visit('/')
    click_button('Add New Word')
    expect(page).to have_content("Definition:")
  end
end
