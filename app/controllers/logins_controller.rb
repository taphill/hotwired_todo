# frozen_string_literal: true

class LoginsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to '/'
    else
      flash.now[:error] = 'Incorrect username or password'
      render 'root/index', status: :unprocessable_entity
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/'
  end
end
