# frozen_string_literal: true

module Users
  class TodosController < ApplicationController
    def create
      @todo = Todo.create(todo_params)
    end

    def destroy
      todo = Todo.find(params[:id])
      todo.destroy

      render turbo_stream: turbo_stream.remove(todo)
    end

    private

    def todo_params
      params.permit(:user_id, :description)
    end
  end
end
