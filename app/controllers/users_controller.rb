# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_user, except: %i[show index new create]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You have successfully registered'
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'update success'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Your account has successfully been closed!'
      session[:user_id] = nil unless current_user.admin?
    else
      flash[:danger] = 'The account could not be closed'
    end
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_same_user
    return unless current_user != @user && !current_user.admin?

    flash[:danger] = 'You can only modify your own profile'
    redirect_to @user
  end
end
