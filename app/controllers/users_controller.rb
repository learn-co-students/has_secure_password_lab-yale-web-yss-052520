class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def welcome
    #byebug
    @user = User.find_by(id: session[:user_id])

  end

  def create
    @user = User.create(user_params)
    return redirect_to signup_path unless @user.save
    session[:user_id] = @user.id

    redirect_to welcome_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

def new
end

def create

end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end