# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end
end
