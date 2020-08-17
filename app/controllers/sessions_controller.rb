class SessionsController < ApplicationController
    def home 
    end 

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to concerts_path
        else 
            flash[:error] = "Invalid login credentials"
            redirect_to login_path 
        end 
    end 

    def githubcreate 
        byebug
        User.first_or_create(auth)
        session[:user_id] = user.id
        redirect_to concerts_path
    end 

    def destroy 
        session.clear 
        redirect_to root_path
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 
end