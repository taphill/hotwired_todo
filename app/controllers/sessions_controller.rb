# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render 'root/show'
    else
      flash.now[:error] = 'Incorrect username or password'
      render 'root/index', status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
