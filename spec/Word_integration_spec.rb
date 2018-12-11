require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words') do
    visit('/')
    expect(page).to have_content('Animal Dictionary')
  end
end

describe('the Word Definer', {:type => :feature}) do
  it('Shows a list of words and displays their definitions') do
    visit('/addword')
    fill_in('user_word', :with => 'test')
    fill_in('user_definition', :with => 'test words')
    click_button('Add')
    expect(page).to have_content("test")
  end
end

describe('the Word Definer', {:type => :feature}) do
  it('will take the user to an individual page landing') do
    eagle = Word.new({:word =>"eagle", :definition =>"a diurnal bird of prey"})
    eagle.save
    visit('/')
    click_link('eagle')
    expect(page).to have_content("a diurnal bird of prey")
  end
end

describe('the Word Definer', {:type => :feature}) do
  it('will take the user to an individual page landing') do
    visit('/output/1')
    fill_in('add_def', :with => "change first definition")
    click_button('Edit')
    expect(page).to have_content("")
  end
end
