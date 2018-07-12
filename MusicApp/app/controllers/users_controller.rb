class UsersController < ApplicationController

  # def index
  #   render :index
  # end

  def new
    render :new
  end

  def create
    user = User.new(user_params[:user][:email], user_params[:user][:password])
    debugger
    if user.save
      login(@user)
      redirect_to user_url
    else
      flash.now[:errors] = 'Invalid email or password'
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
