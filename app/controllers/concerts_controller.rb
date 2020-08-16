class ConcertsController < ApplicationController
    
    def index 
        @concerts = Concert.all 
    end 

    def filter 
        @concerts = Concert.search_by_location(params[:location]).order_by_name
        @concerts = Concert.order_by_name if @concerts == []
        render :index
    end 

    def show 
        @concert = Concert.find_by_id(params[:id])
    end 

end
