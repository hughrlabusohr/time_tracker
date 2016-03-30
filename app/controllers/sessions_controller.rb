class SessionsController < ApplicationController
  def dashboard
  end
  def new
  end
  def create

    @developer = Developer.find_by(email: params[:email])
    if @developer && @developer.authenticate(params[:password])
      session[:user_id] = @developer.id
      redirect_to developers_path, notice: "You have succesfully logged in!"
    else
      flash.now[:alert] = "Login failed: invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have logged out."
  end
end
