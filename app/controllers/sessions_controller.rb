class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(name: params[:user][:name])
    #byebug
    return redirect_to login_path unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

end