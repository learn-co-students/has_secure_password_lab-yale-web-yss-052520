class UsersController < ApplicationController

    # before_action :require_logged_in
    
    def new
        @user = User.new 
    end

    def create
        # byebug
        @user = User.create(user_params)
        return redirect_to new_user_path unless @user.save 
        session[:user_id] = @user.id 
        redirect_to user_path(@user.id)
    end 

    def show
        @user = User.find(session[:user_id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end
