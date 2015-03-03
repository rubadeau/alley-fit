require 'rails_helper'

feature 'Events' do

  scenario 'User sees headline' do

    visit root_path
    expect(page).to have_content('Active Clients')
  end

  scenario 'index lists all active clients with name' do
    client_1 = Client.new(client_id: '1', name: 'Unhealthy Annie')
    client.save!

    expect(current_path).to eq clients_path

    expect(page).to have_content 'Unhealthy Annie'
    expect(page).to have_link 'New Cheese'
  end

  scenario 'can make a new client from the new client form' do
    click_link 'New Client'

    expect(current_path).to eq new_client_path

    fill_in :name, with: 'Overweight Dan'
    click_button 'Create Client'

    expect(current_path).to eq clients_path
    expect(page).to have_content 'Cheese created successfully!'
    expect(page).to have_content 'Overweight Dan'
  end

  scenario 'index links to show via the clients name' do
    client_1 = Client.new(client_id: '1', name: 'Unhealthy Annie')
    client.save!

    click_link 'Unhealthy Annie'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Unhealthy Annie'
  end
end
