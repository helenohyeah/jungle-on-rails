class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password is correct
    if user && user.authenticate(params[:password])
      puts "user>>>> #{user.inspect}"
      # Save the user_id inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    # If login fails, send them back to login form
    else
      redirect_to '/login'
    end
  end

  def destroy
    # Logout user and clear browser cookie
    session[:user_id] = nil
    redirect_to '/login'
  end

end
