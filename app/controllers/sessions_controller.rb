class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by_username(username)
    
    if user && user.authenticate(password)
      session[:user_id] = user.id
  	  redirect_to root_path, notice: "Logged in successfully"
  	else
  	  redirect_to login_path, alert: "Invalid username/password combination"
  	end
  end

  def destroy
  	reset_session # wipe out session and everything in it
    redirect_to login_path, notice: "You have been logged out"
  end
  
end
