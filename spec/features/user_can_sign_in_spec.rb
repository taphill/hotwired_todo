# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User can sign in', type: :feature do
  before do
    visit '/'
  end

  context 'when successful' do
    it 'signs the user in' do
      user = create(:user, password: 'password', password_confirmation: 'password')

      fill_in :username, with: user.username
      fill_in :password, with: 'password'

      click_button 'Sign in'

      expect(page).to have_content("Hello, #{user.username}!")
    end
  end

  context 'when username is wrong' do
    it 'displays error' do
      user = create(:user, username: 'mikejones')

      fill_in :username, with: 'hi'
      fill_in :password, with: user.password

      click_button 'Sign in'

      expect(page).to have_content('Incorrect username or password')
    end
  end

  context 'when password is wrong' do
    it 'displays error' do
      user = create(:user, password: 'password', password_confirmation: 'password')

      fill_in :username, with: user.username
      fill_in :password, with: 'pass'

      click_button 'Sign in'

      expect(page).to have_content('Incorrect username or password')
    end
  end

  context 'when both fields are empty' do
    it 'displays error' do
      fill_in :username, with: ''
      fill_in :password, with: ''

      click_button 'Sign in'

      expect(page).to have_content('Incorrect username or password')
    end
  end
end
