require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('the word path', {:type => :feature}) do
  it('adds a word and returns success') do
    visit('/word/new')
    fill_in('Word:', :with => 'cow')
    click_button('Add word')
    expect(page).to have_content('Success!')
  end
end

describe('the definition path', {:type => :feature}) do
  it('adds a definition to the word') do
    visit('/words')
    click_link('cow')
    expect(page).to have_content('meaning', 'speech', 'source')
  end
end
