class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    # If the user exists and the password is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
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
