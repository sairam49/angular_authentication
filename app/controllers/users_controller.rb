class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    render json: @user
  end

  private
  def user_params
    params.fetch(:user,{}).permit(:email,:password,:password_confirmation)
  end
end
