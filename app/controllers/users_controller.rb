class UsersController < ApplicationController

    def create 
        if params[:password] == params[:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id 
        end 
        redirect_to controller: 'users', action: 'new'          
    end 

    def new 
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end 