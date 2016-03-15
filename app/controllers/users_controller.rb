class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to users_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    return unless authorized
    @user = User.find(params[:id])
  end

  def update
    return unless authorized
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def authorized
    if @current_user == @user
      return true
    else
      flash[:alert] = "You can edit only your own profile."
      redirect_to :root
      return false
    end
  end

end
