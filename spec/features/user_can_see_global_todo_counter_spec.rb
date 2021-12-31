# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User can see the global todo counter', type: :feature do
  let!(:user) { create(:user) }
  let!(:todo) { create(:todo, user: user) }

  before do
    visit '/'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Sign in'
  end

  it 'can see todo counter' do
    expect(page).to have_content('Total todos needing to be done: 1')
  end

  it 'can see the counter increase' do
    expect(page).to have_content('Total todos needing to be done: 1')

    create(:todo, user: user)
    visit '/'
    expect(page).to have_content('Total todos needing to be done: 2')
  end

  it 'can see the counter decrease' do
    expect(page).to have_content('Total todos needing to be done: 1')

    user.todos.first.destroy
    visit '/'
    expect(page).to have_content('Total todos needing to be done: 0')
  end
end
