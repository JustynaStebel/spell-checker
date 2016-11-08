class UsersController < ApplicationController

  def show
    @user = User.find(current_user)
    @document = Document.new
  end

  def edit
  end

  def update
    user = User.find(current_user)
    user.update!(user_params)
    redirect_to user
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def document_params
    params.require(:document).permit(:name)
  end
end
