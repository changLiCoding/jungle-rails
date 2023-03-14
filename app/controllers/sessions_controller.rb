class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end

  def new

  end

  def create

    if user = User.authenticate_with_credentials(params[:e_mail], params[:password])
      session[:user_id] = user.id
      redirect_to [:products], notice: 'User Signed In Successfully!'
        # success logic, log them in
    else
        # failure, render login form
      flash[:alert] = "Invalid Email or password."
      render :new
    end
  end
end
