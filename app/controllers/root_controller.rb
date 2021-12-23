# frozen_string_literal: true

class RootController < ApplicationController
  def index
    render :show if current_user
  end

  def show
    render :index unless current_user
  end
end
