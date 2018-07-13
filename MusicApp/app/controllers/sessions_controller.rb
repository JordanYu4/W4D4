class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user][:email], user_params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "User not recognized"
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
  end

end
