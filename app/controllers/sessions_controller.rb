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
            redirect_to user_path(@user)
        else 
            redirect_to root_path 
        end 
    end 

    def githubcreate 
        session[:name] = auth['info']['name']
        session[:omniauth_data] = auth 
        redirect_to users_path
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