class ArtistsController < ApplicationController

    def index 
        @artists = Artist.all
    end 

    def show 
        @artist = Artist.find_by_id(params[:id])
    end 

    def new 
        @artist = Artist.new
    end 

    def create 
        @artist = Artist.new(artist_params)
        if @artist.save  
            session[:artist_id] = @artist.id
            redirect_to concerts_path
        else 
            render :new 
        end 
    end 

    private 

    def artist_params 
        params.require(:artist).permit(:artist_name, :phone_number, :password)
    end

end
