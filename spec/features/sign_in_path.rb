require 'rails_helper'

  feature 'Sign In' do

    before :each do
      Client.destroy_all
    end

    scenario 'Users can sign in' do

      user = Client.create!(
      name: 'Bruce',
      email: 'bamf@diehard.com',
      password: 'quitelikeamouse',
      password_confirmation: 'quitelikeamouse')

      visit sign_in_path

      expect(current_path).to eq '/sign-in'
      expect(page).to have_content 'Sign into AlleyFit'
      click_button 'Sign In'
      expect(page).to have_content 'Email / Password combination is invalid'

      fill_in 'Email', with: 'bamf@diehard.com'
      fill_in "Password", with: 'quitelikeamouse'
      click_button 'Sign In'

      expect(page).to have_content 'Bruce Willis'
      expect(page).to have_content 'You have successfully signed in'
    end

    scenario 'Client redirected if error' do
      visit root_path
      click_link 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Sign into AlleyFit'

      fill_in 'Email', with: 'fail@diehard.com'
      fill_in 'Password', with: 'notquitelikeamouse'
      click_button 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Email / Password combination is invalid'
    end
end
