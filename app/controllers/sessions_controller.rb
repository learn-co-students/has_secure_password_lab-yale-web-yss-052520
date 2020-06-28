class SessionsController < ApplicationController

    def new 
    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        return redirect_to '/login' unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
    end 

    private 

    def session_params
        params.require(:user).permit(:name, :password)
    end 

end 