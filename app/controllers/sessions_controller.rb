class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.exists?(username: params[:user][:username])
      @user = User.find_by(username: params[:user][:username])
      if @user.password === params[:user][:password]
        puts "You're signed in!"
        redirect_to :root
      else
        puts "Wrong password!"
        redirect_to new_session_path
      end
    else
      puts "That user doesn't exist!"
      redirect_to new_session_path
    end
  end

  def destroy
    puts "You're signed out!"
    redirect_to :root
  end

end
