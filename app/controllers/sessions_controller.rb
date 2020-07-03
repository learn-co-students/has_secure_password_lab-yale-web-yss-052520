class SessionsController < ApplicationController

    
    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        # byebug
        session[:user_id] = @user.id
        # elsif !(params.include? :user && params[:user].include? [:password] || params[:user][:password].empty?
        #     flash[:message] = "Passwords can't be empty"
        #     redirect_to new_user_path
    end

end
