# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User can add and delete todos', type: :feature do
  let!(:user) { create(:user) }
  let!(:todo) { create(:todo, user: user) }

  before do
    visit '/'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Sign in'
  end

  xit 'can add a todo' do
    content = 'Do the dishes'

    fill_in :description, with: content

    click_button 'Add todo'

    expect(page).to have_content(content)
  end

  it 'can delete a todo' do
    expect(page).to have_content(todo.description)

    within "#todo_#{todo.id}" do
      click_button
    end

    expect(page).not_to have_content(todo.description)
  end
end
