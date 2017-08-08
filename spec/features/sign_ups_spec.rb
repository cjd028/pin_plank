require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  it "signs me up" do
    visit '/users/new'
    within("#new_user") do
      fill_in 'Name', with: 'Chris'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Confirmation', with: 'password'
    end
    click_button 'Create my account'
    expect(page).to have_content 'User Page'
  end
end
