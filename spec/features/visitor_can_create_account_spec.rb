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
      password = 'Houston!!'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(User.first.username).to eq('mikejones')
      expect(page).to have_content('Hello, mikejones!')
    end
  end

  context 'when password does not match password confirmation' do
    it 'displays error' do
      username = 'mikejones'
      password = 'Houston!!'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: 'pass'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  context 'when username is already taken' do
    it 'displays error' do
      create(:user, username: 'mikejones')

      username = 'mikejones'
      password = 'Houston!!'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(User.count).to eq(1)
      expect(page).to have_content('Username has already been taken')
    end
  end

  context 'when username is blank' do
    it 'displays error' do
      password = 'Houston!!'

      fill_in :user_username, with: ''
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Create account'

      expect(User.all).to be_empty
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

      expect(User.all).to be_empty
      expect(page).to have_content("Password can't be blank")
    end
  end

  context 'when password is to short' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: 'pass'
      fill_in :user_password_confirmation, with: 'pass'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content('Password is too short (minimum is 8 characters)')
    end
  end

  context 'when password is to long' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: 'lkoijerijwpoiretiorjoiejfclaksdjfopqiwejrjasdlkfjqwoeijflaksdfnclkajsdfopiqwenr'
      fill_in :user_password_confirmation, with: 'lkoijerijwpoiretiorjoiejfclaksdjfopqiwejrjasdlkfjqwoeijflaksdfnclkajsdfopiqwenr'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content('Password is too long (maximum is 72 characters)')
    end
  end

  context 'when password does not have a lowercase character' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: 'PASSWORD!'
      fill_in :user_password_confirmation, with: 'PASSWORD!'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content('Password must use at least: 1 uppercase, 1 lowercase, and 1 special character')
    end
  end

  context 'when password does not have an upercase character' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: 'password!'
      fill_in :user_password_confirmation, with: 'password!'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content('Password must use at least: 1 uppercase, 1 lowercase, and 1 special character')
    end
  end

  context 'when password does not have a special character' do
    it 'displays error' do
      username = 'mikejones'

      fill_in :user_username, with: username
      fill_in :user_password, with: 'Password'
      fill_in :user_password_confirmation, with: 'Password'

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content('Password must use at least: 1 uppercase, 1 lowercase, and 1 special character')
    end
  end

  context 'when all fields are blank' do
    it 'displays errors' do
      fill_in :user_username, with: ''
      fill_in :user_password, with: ''
      fill_in :user_password_confirmation, with: ''

      click_button 'Create account'

      expect(User.all).to be_empty
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end
end
