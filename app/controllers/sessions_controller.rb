class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by(params[:email])
    # If the user exists and the password is correct
    puts "here>>>> #{params[:password]}"
    if user && user.authenticate('password')
      # Save the user_id inside browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    # If login fails, send them back to login form
    else
      render :new
    end
  end

  def destroy
    # Logout user and clear browser cookie
    session[:user_id] = nil
    redirect_to '/'
  end

end
