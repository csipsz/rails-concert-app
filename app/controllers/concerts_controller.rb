class ConcertsController < ApplicationController
    before_action :require_login
    before_action :set_concert, only: [:show, :destroy]
    
    def index 
        @concerts = Concert.all 
    end 

    def filter 
        #order_by_name just making sure that my scope methods are chainable
        @concerts = Concert.search_by_location(params[:location]).order_by_name
        @concerts = Concert.order_by_name if @concerts == []
        render :index
    end 

    def show 
        
    end 

    def new 
        @concert = Concert.new
        @concert.comments.build(content: "add a comment")
    end 

    def create 
        @concert = Concert.new(concert_params)
        @concert.artist = current_artist
        if @concert.save 
            redirect_to concert_path(@concert)
        else 
            render :new 
        end 
    end 

    def destroy 
        @concert.destroy
        redirect_to artist_path(@concert.artist)
    end 

    private 

    def set_concert
        @concert = Concert.find_by_id(params[:id])
    end 

    def concert_params
        params.require(:concert).permit(:location, :capacity, :date, comments_attributes: [:content])
    end 

end
