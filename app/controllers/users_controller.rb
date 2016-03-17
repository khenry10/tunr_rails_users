class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # create
  def create
    @user = User.find(params[:user])
    @user = @artist.users.create(user_params)

    redirect_to @user
  end

  #show
  def show
    @user = User.find(params[:id])
  end

  # edit
  def edit
    @user = User.find(params[:id])
  end

  # update
  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to users_path(@user)
  end

  # destroy
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
