def sign_in_client
  client = Client.create!(
    name: "Test",
    email: "test@test.com",
    password: "password",
    password_confirmation: "password")

  visit sign_in_path
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign In'
end
