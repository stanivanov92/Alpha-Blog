# frozen_string_literal: true

# Class for user sessions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      flash[:notice] = 'Logged in successfully'
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = 'Your username and password does not match'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'User was logged out'
    redirect_to root_path
  end
end
