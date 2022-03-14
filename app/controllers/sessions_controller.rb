class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, you are logged in!"
        redirect_to "/"
      else
        flash[:notice] = "Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Please try again"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out."
    redirect_to "/sessions/new"
  end
end
