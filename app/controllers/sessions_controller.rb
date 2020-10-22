class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]
  def new
    render 'index'
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    user = User.find_by_email(email).try(:authenticate, password)
    if user
        session[:id] = user.id
        redirect_to songs_path
    else
        flash[:notice] = "Invalid login!"
        redirect_to root_path
    end
  end

  def destroy
      session[:id] = nil
      redirect_to root_path
  end

end
