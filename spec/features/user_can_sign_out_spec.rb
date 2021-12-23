# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User can sign out', type: :feature do
  before do
    user = create(:user)

    visit '/'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Sign in'
  end

  it 'can sign the user out' do
    click_button 'Sign out'

    expect(page).to have_field(:username)
    expect(page).to have_field(:password)
  end
end
