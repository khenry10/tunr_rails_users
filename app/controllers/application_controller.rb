class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_current_user

  def get_current_user
    user_id = session[:user_id]
    if User.exists?(session[:user_id])
      @current_user = User.find(user_id)
    else
      @current_user = nil
    end
  end

  def authorized
    if @current_user
      return true
    else
      flash[:alert] = "You must be signed in to do that!"
      redirect_to :root
      return false
    end
  end

end
