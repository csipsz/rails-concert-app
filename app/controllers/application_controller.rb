class ApplicationController < ActionController::Base

    helper_method :current_user, :current_artist, :logged_in?, :logged_in_as_artist?
    

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end 

    def current_artist 
        @current_artist ||= Artist.find_by_id(session[:artist_id])
    end 

    def logged_in? 
        !!session[:user_id]
    end

    def logged_in_as_artist?
        !!session[:artist_id]
    end 

    def require_login
        if !session.include?(:user_id) && !session.include?(:artist_id)
            return head(:forbidden)
        end 
    end
end
