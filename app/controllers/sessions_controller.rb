class SessionsController < ApplicationController
    def home 
    end 

    def new 
        @user = User.new 
    end 

    def newartist 
        @artist = Artist.new 
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

    def createartist
        @artist = Artist.find_by(artist_name: params[:artist][:artist_name])
        if @artist && @artist.authenticate(params[:artist][:password])
            session[:artist_id] = @artist.id 
            redirect_to concerts_path
        else 
            flash[:error] = "Invalid login credentials"
            redirect_to artistlogin_path 
        end 
    end 

    def githubcreate 
        @user = User.find_or_create_by(uid: auth[:uid]) do |user|
            user.username = auth[:info][:nickname]
            user.email = auth[:info][:nickname] + "@throwaway.com"
            user.password = SecureRandom.hex
        end 
        session[:user_id] = @user.id
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