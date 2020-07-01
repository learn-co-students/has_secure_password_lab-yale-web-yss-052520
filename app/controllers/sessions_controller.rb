class SessionsController < ApplicationController

    def new
        @user = User.new 
    end

    # def create
    #     @user = User.find_by(name: params[:user][:name])

    #     if @user && @user.authenticate(password: params[:user][:password])
    #         session[:user_id] = @user.id 
    #         redirect_to user_path(@user)
    #     else
    #         redirect_to new_session_path
    #     end

    # end

    def create
        user = User.find_by(name: params[:user][:name])
    
        user = user.try(:authenticate, params[:user][:password])
    
        return redirect_to(controller: 'sessions', action: 'new') unless user
    
        session[:user_id] = user.id
    
        @user = user
    
        redirect_to controller: 'users', action: 'new' 
      end
    

    def destroy
        session.destroy 
    end


end
