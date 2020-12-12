class SessionsController < ApplicationController
  before_action :logout_current, only: :new
  # skip_before_action :authenticate, only: :destroy

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path #, notice: 'Logged in!'
    else
      redirect_to login_path, alert: 'Неверная почта или пароль'
      # flash.now[:alert] = 'Email or password is invalid'
      # render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end
  
  private
  
  def logout_current
    session[:user_id] = nil if session[:user_id]
  end
end
