class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.save

    session[:session_token] = user.reset_session_token!

    redirect_to cats_url
  end

  private

  def user_params
    self.params.require(:user).permit(:user_name, :password)
  end
end
