require 'rails_helper'

feature 'Sign Up' do

  before :each do
    Client.destroy_all
  end

  scenario 'user can sign up' do

    visit root_path
    click_link 'Sign Up'
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Sign up for AlleyFit")

    fill_in :client_name, with: 'Test'
    fill_in :client_email, with: 'test@test.com'
    fill_in :client_password, with: 'password'
    fill_in :client_password_confirmation, with: 'password'

    click_button 'Sign Up'

    expect(page).to have_content("You have successfully signed up")
    expect(page).to have_no_content('Sign Up')
  end

end
