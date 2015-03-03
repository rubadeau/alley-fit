require 'rails_helper'

feature 'Clients' do

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
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'
  end

  scenario 'can view workouts by clicking link on clients show' do
    visit root_path
    click_button 'New Client'

    expect(current_path).to eq new_client_path

    fill_in :name, with: 'Overweight Dan'
    click_button 'Create Client'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_link 'Overweight Dan'

    expect(page).to have_content 'Overweight Dan'

    click_button 'New Workout'
    fill_in :date, with: '03/03/1992'
    fill_in :time, with: '03:30 AM'
    fill_in :workout, with: 'Pull ups'
    fill_in :comments, with: 'are hard'
    click_button 'Create Workout'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Workout created successfully!'

    click_link '03/03/1992'

    expect(page).to have_content 'Pull ups'
  end

  scenario 'can view assessments by clicking link on clients show'
    visit root_path
    click_button 'New Client'

    expect(current_path).to eq new_client_path

    fill_in :name, with: 'Overweight Dan'
    click_button 'Create Client'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_link 'Overweight Dan'

    expect(page).to have_content 'Overweight Dan'

    click_button 'New Assessment'
    fill_in :assessment_name, with: 'Initial Assessment'
    click_button 'Create Assessment'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Assessment created successfully!'

    click_link 'Initial Assessment'

    expect(page).to have_content 'Initial Assessment'
  end
end
