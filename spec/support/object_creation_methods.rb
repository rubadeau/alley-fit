def create_client
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
