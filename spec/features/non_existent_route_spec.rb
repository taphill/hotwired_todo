# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits page that does not exist', type: :feature do
  before do
    visit '/noroute'
  end

  it { expect(page).to have_content("Sorry, this isn't the page you're looking for.") }
end
