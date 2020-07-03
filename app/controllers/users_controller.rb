class UsersController < ApplicationController

    def show
    end

    def new
        @user = User.new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirmation]
            flash[:message] = "Passwords don't match"
            redirect_to new_user_path    
        else
            @user = User.create(user_params)
            byebug
            session[:user_id] = @user.id
            redirect_to '/home'
        end
       
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
