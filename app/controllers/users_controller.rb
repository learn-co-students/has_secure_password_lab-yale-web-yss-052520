class UsersController < ApplicationController 
    def new 
        @user = User.new 
    end 

    def create 
        if params[:user][:password] != params[:user][:password_confirmation]
            redirect_to "/new"
        else 
            new_user = User.create(user_params)
            session[:user_id] = new_user.id
            redirect_to "/welcome/#{new_user.id}"
        end 
    end 

    def welcome
        @user = User.find(session[:user_id]) 
    end 


    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end 