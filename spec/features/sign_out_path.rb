require 'rails_helper'

  feature 'Sign Out' do

    before :each do
      Client.destroy_all
    end

    scenario 'Users can sign out' do

      sign_in_client

      expect(page).to have_content("Test")

      click_on 'Sign Out'

      expect(page).to have_content 'Sign In'
      expect(page).to have_content("You have successfully logged out")
    end
end
