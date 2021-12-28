# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  # Turbo stream broadcasts should be used when you need to broadcast
  # updates to all users at the sames time. This will allow every user to see the changes as they happen.
  # Below are the methods I used to get this working:
  #
  # after_create_commit :add_todo
  # after_destroy_commit :remove_todo

  private
  
  def add_todo
    broadcast_append_to(
      'todos',
      partial: 'todos/todo',
      locals: { todo: self, current_user: user},
      target: 'todo-list'
    )
  end

  def remove_todo
    broadcast_remove_to(
      'todos',
      target: self
    )
  end
end
