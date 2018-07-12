class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user][:email], user_params[:user][:password])
    if @user
      log_in_user(@user)
      redirect_to "user/#{@user}"
    else
      flash.now[:errors] = "User not recognized"
      redirect_to "session/new"
    end
  end

  def destroy
    session[:session_token] = nil
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
