# frozen_string_literal: true

class PasswordExplainerComponent < ViewComponent::Base
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end
end
