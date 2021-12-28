# frozen_string_literal: true

class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 72 }
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'must use at least: 1 uppercase, 1 lowercase, and 1 special character'
  end
end
