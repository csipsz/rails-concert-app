class ConcertsController < ApplicationController
    before_action :set_concert, only: [:show, :edit, :update, :destroy]
    def index 
        @concerts = Concert.all
    end 

    def new 
        @concert = Concert.new
    end 

    def create 
        @concert = Concert.new(concert_params)
        if @concert.save 
            redirect_to concert_path(@concert)
        else 
            render :new 
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
        @concert.update(concert_params)
        if @concert.save 
            redirect_to concert_path(@concert)
        else 
            render :edit 
        end 
    end 

    def destroy 
        @concert.destroy 
        redirect_to concerts_path
    end 


    private 

    def set_concert 
        @concert = Concert.find_by_id(params[:id])
    end 

    def concert_params
        params.require(:concert).permit(:location, :artist_id)
    end 
end
