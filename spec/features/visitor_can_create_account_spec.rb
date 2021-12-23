# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor can create account', type: :feature do
  before do
    visit '/'
    click_link 'Register now'
  end

  context 'when successful' do
    it 'creates a new user account' do
      username = 'mikejones'
      password = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(page).to have_content('Hello, mikejones!')
    end
  end

  context 'when password does not match password confirmation' do
    it 'displays error' do
      username = 'mikejones'
      password = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: 'pass'

      click_button 'Create account'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  context 'when username is already taken' do
    it 'displays error' do
      create(:user, username: 'mikejones')

      username = 'mikejones'
      password = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(page).to have_content('Username has already been taken')
    end
  end

  context 'when username is blank' do
    it 'displays error' do
      password = 'houston'

      fill_in :user_username, with: ''
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(page).to have_content("Username can't be blank")
    end
  end

  context 'when password is blank' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: ''
      fill_in :user_password_confirmation, with: ''

      click_button 'Create account'

      expect(page).to have_content("Password can't be blank")
    end
  end

  context 'when all fields are blank' do
    it 'displays errors' do
      fill_in :user_username, with: ''
      fill_in :user_password, with: ''
      fill_in :user_password_confirmation, with: ''

      click_button 'Create account'

      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end
end
