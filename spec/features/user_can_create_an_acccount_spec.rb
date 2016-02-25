require 'rails_helper'

RSpec.feature 'user can create an account' do
  scenario 'they create an account' do
    username = 'harrypotter'
    password = 'hedwig'

    visit '/'

    click_on 'Create account'

    fill_in 'Username', with: username
    fill_in 'Password', with: password

    click_on 'Create account'

    expect(page).to has_content("Welcome #{username}!")
    expect(page).to has_content("Created new account!")

      #user visits home page
      #user clicks on create account
      #fill in username and password
      #click on create account
      #on their account page they should see welcome username
      #also see that they created a new account
  end

end
