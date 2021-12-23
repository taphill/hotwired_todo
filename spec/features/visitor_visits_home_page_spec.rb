# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor visits home page', type: :feature do
  before do
    visit '/'
  end

  it { expect(page).to have_field(:username) }
  it { expect(page).to have_field(:password) }
  it { expect(page).to have_button('Sign in') }
  it { expect(page).to have_link('Register now') }

  context 'when visitor clicks the register now link' do
    it 'can see the sign up form' do
      click_link 'Register now'

      expect(page).to have_field(:user_username)
      expect(page).to have_field(:user_password)
      expect(page).to have_field(:user_password_confirmation)
      expect(page).to have_button('Create account')
      expect(page).to have_link('Sign in')
    end
  end
end
