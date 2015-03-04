require 'rails_helper'

feature 'Clients' do

  scenario 'User sees headline' do

    visit root_path
    expect(page).to have_content('Active Clients')
  end

  scenario 'can make a new client from the new client form' do
    visit root_path
    click_on 'New Client'
    expect(current_path).to eq new_client_path
    fill_in 'Name', with: 'Overweight Dan'
    click_on 'Create Client'
    client = Client.last
    expect(current_path).to eq client_path(client)

    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'
  end

  scenario 'can view workouts by clicking link on clients show' do
    visit root_path
    click_on 'New Client'

    expect(current_path).to eq new_client_path

    fill_in 'Name', with: 'Overweight Dan'
    click_on 'Create Client'
    client = Client.last
    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_on 'New Workout'
    fill_in 'Date', with: '03/03/1992'
    fill_in 'Time', with: '03:30 AM'
    fill_in 'Workout', with: 'Pull ups'
    fill_in 'Comments', with: 'are hard'
    click_on 'Create Workout'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Workout created successfully!'

    click_link '1992-03-03'

    expect(page).to have_content 'Pull ups'
  end

  scenario 'can view assessments by clicking link on clients show' do
    visit root_path
    click_on 'New Client'

    expect(current_path).to eq new_client_path

    fill_in 'Name', with: 'Overweight Dan'
    click_on 'Create Client'
    client = Client.last
    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_on 'New Assessment'
    fill_in 'Assessment name', with: 'Initial Assessment'
    click_on 'Create Assessment'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Assessment created successfully!'

    click_link 'Initial Assessment'

    expect(page).to have_content 'Initial Assessment'
  end

  scenario 'can update and delete workouts' do
    visit root_path
    click_on 'New Client'

    expect(current_path).to eq new_client_path

    fill_in 'Name', with: 'Overweight Dan'
    click_on 'Create Client'
    client = Client.last
    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_on 'New Workout'
    fill_in 'Date', with: '03/03/1992'
    fill_in 'Time', with: '03:30 AM'
    fill_in 'Workout', with: 'Pull ups'
    fill_in 'Comments', with: 'are hard'
    click_on 'Create Workout'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Workout created successfully!'

    click_link '1992-03-03'

    expect(page).to have_content 'Pull ups'
    click_on 'Update Workout'
    fill_in 'Comments', with: 'are easy'
    click_on 'Update Workout'

    expect(page).to have_content 'Workout updated successfully!'

  end

  scenario 'can update assessments' do
    visit root_path
    click_on 'New Client'

    expect(current_path).to eq new_client_path

    fill_in 'Name', with: 'Overweight Dan'
    click_on 'Create Client'
    client = Client.last
    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Client created successfully!'
    expect(page).to have_content 'Overweight Dan'

    click_on 'New Assessment'
    fill_in 'Assessment name', with: 'Initial Assessment'
    click_on 'Create Assessment'

    expect(current_path).to eq client_path(client)
    expect(page).to have_content 'Assessment created successfully!'

    click_link 'Initial Assessment'

    expect(page).to have_content 'Initial Assessment'

    click_on 'Update Assessment'
    fill_in 'Assessment name', with: 'Updated Initial Assessment'
    click_on 'Update Assessment'

    expect(page).to have_content 'Assessment updated successfully!'

  end
end
