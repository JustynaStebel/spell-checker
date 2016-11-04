class Admin::UsersController < ApplicationController
  def index
    @users = User.all.without_admin
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    User.create(user_params)
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
