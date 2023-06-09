class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    # if user && user.authenticate(params[:password])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      session[:admin] = user.admin
      session[:address_id] = user.address_id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
