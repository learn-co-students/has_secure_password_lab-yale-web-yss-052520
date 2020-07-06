class SessionsController < ApplicationController 

    def new 

    end 

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            @user = user 
            redirect_to root_path 
        else 
            redirect_to "new"
        end
    end 

end 