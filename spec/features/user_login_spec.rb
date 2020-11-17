require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  #SETUP
  before :each do
    @user = User.create!(
      first_name: 'Tester',
      last_name: 'One',
      email: 'tester1@gmail.com',
      password: '123456'
    )
    @category = Category.create! name: 'Apparel'
  end

  scenario "Can login successfully and taken to home page" do
    visit root_path
    click_on('Login')
    fill_in 'email', with: 'tester1@gmail.com'
    fill_in 'password', with: '123456'
    # save_screenshot
    find('input[name="commit"]').click
    # save_screenshot

    expect(page).to have_text 'Logout', count: 1
    expect(page).to have_text 'Products', count: 1
  end

end
