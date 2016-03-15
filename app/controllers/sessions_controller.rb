class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.exists?(username: params[:user][:username])
      @user = User.find_by(username: params[:user][:username])
      if @user.password === params[:user][:password]
        flash[:notice] = "You're signed in!"
        session[:user_id] = @user.id
        redirect_to :root
      else
        flash[:alert] = "Wrong password!"
        redirect_to new_session_path
      end
    else
      flash[:alert] = "That user doesn't exist!"
      redirect_to new_session_path
    end
  end

  def destroy
    flash[:notice] = "You're signed out!"
    reset_session
    redirect_to :root
  end

end
