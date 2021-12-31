# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  # Turbo stream broadcasts should be used when you need to broadcast
  # updates to all users at the sames time. This will allow every user to see the changes as they happen.
  # More information can be found here: https://github.com/hotwired/turbo-rails/blob/main/app/models/concerns/turbo/broadcastable.rb

  after_commit :update_todo_count

  private

  def update_todo_count
    broadcast_update_to('todos', target: 'todo-count', html: Todo.count.to_s )
  end
end
