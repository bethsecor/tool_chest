class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:welcome_message] = "Welcome back!"
      # redirect_to @user
      redirect_to tools_path
    else
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
