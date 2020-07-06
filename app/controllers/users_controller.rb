class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        if params[:password] == params[:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id 
        end 
        redirect_to controller: 'users', action: 'new'          
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end 
