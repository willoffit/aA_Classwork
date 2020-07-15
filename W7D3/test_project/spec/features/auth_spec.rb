require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    scenario 'shows email on the homepage after signup' do
      visit new_user_url
      fill_in 'Email', with: 'a@b.com'
      fill_in 'Password', with: 'abcdegeagae'
      click_button 'Sign Up'
      expect(page).to have_content parameters[:user][:email]
      expect(page).to be(root_url)
    end

  end
end

feature 'logging in' do
  scenario 'shows email on the homepage after login' do
      visit new_session_url
      fill_in 'Email', with: 'a@b.com'
      fill_in 'Password', with: 'abcdegeagae'
      click_button 'Sign In'
      expect(page).to have_content parameters[:user][:email]
      expect(page).to be(root_url)
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    expect(session[session_token]).to be(nil)
  end

  scenario 'doesn\'t show email on the homepage after logout' do
    click_button 'Log Out'
    expect(page).to not_have_content parameters[:user][:email]
  end

end