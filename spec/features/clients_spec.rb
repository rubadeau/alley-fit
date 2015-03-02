require 'rails_helper'

feature 'Events' do

  scenario 'User sees headline' do

    visit root_path
    expect(page).to have_content('Active Clients')
  end
end
