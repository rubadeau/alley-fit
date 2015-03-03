require 'rails_helper'

feature 'Events' do

  scenario 'User sees headline' do

    visit root_path
    expect(page).to have_content('Active Clients')
  end

  scenario 'can make a new client from the new client form' do
    visit root_path
    click_button 'New Client'

    expect(current_path).to eq new_client_path

    fill_in :name, with: 'Overweight Dan'
    click_button 'Create Client'

    expect(current_path).to eq clients_path
    expect(page).to have_content 'Cheese created successfully!'
    expect(page).to have_content 'Overweight Dan'

  end
end
