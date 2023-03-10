class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end

  def new

  end


  def create
    user = User.find_by(e_mail: params[:e_mail])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to [:products], notice: 'User Signed In Successfully!'
    else
      flash[:alert] = "Invalid Email or password."
      render :new
    end
  end
end
