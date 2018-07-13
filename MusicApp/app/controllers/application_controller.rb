class ApplicationController < ActionController::Base

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!curent_user
  end

  def log_in_user!(user)
    user.reset_sesson_token!
    session[:session_token] = user.session_token
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
