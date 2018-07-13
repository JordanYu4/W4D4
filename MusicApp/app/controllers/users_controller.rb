class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = 'Invalid email or password'
      render :new
    end
  end

end
