class TicketsController < ApplicationController
        before_action :set_ticket, only: [:show, :edit, :update, :destroy]
        def index 
            if params[:user_id]
                @tickets = User.find(params[:user_id]).tickets 
            else 
                @tickets = Ticket.all
            end 
        end 
    
        def new 
            @ticket = Ticket.new()
        end 
    
        def create 
            @ticket = current_user.tickets.build(ticket_params)
            @ticket.set_price
            if @ticket.save 
                redirect_to ticket_path(@ticket)
            else 
                render :new 
            end 
        end 
    
        def show 
        end 
    
        def edit 
        end 
    
        def update 
            @ticket.update(ticket_params)
            @ticket.user_id = current_user
            if @ticket.save 
                redirect_to ticket_path(@ticket)
            else 
                render :edit 
            end 
        end 
    
        def destroy 
            @ticket.destroy 
            redirect_to  tickets_path
        end 
    
    
        private 
    
        def set_ticket 
            @ticket = Ticket.find_by_id(params[:id])
        end 
    
        def ticket_params
            params.require(:ticket).permit(:category, :quantity, :concert_id)
        end 
    
    end
