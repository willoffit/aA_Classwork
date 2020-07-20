class UsersController < ApplicationController

  before_action :require_user!, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user.destroy
      render :new
    else
      flash.now[:errors] = @user.errors.full_messages
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
