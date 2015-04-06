require 'spec_helper'

RSpec.describe 'Navigation' do
  it "works", type: :feature do
    visit 'http://www.google.com/'
    fill_in 'lst-ib', with: "selenium search rspec \r"
    expect(page).to have_content('YouTube')
  end

  it "fails", type: :feature do
    visit 'http://www.google.com/'
    fill_in 'lst-ib', with: "selenium search rspec \r"
    expect(page).not_to have_content('YouTube')
  end
end
