# frozen_string_literal: true

class ErrorExplainerComponent < ViewComponent::Base
  attr_reader :errors

  def initialize(errors:)
    @errors = errors
  end
end
