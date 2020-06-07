class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash.notice = "Successfully signed in."
      redirect_to @user
    else
      render :new 
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "Sucessfully logged out."
    redirect_to users_login_path
  end
end
