# frozen_string_literal: true

# Class for user sessions
class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user&.authenticate(params[:session][:password])
      new_session
    else
      flash.now[:alert] = 'Your username and password does not match'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = 'User was logged out'
    redirect_to root_path
  end

  def new_session
    flash[:success] = 'Logged in successfully'
    session[:user_id] = @user.id
    redirect_to @user
  end
end
