class CommentsController < ApplicationController

    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    def index 
    end 

    def new 
    end 

    def show 
    end 

    def create 
    end 

    def edit 
    end 

    def update 
    end 

    def destroy 
    end 

    private 

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end 
end
