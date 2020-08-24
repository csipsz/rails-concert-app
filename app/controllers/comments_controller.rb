class CommentsController < ApplicationController
    before_action :require_login
    before_action :set_comment, only: [:show, :destroy]
    def index 
        if params[:concert_id]
            @concert = Concert.find(params[:concert_id])
            @comments = @concert.comments
            redirect_to concert_path(@concert)
          else
            #@comments = Comment.all
            redirect_to concerts_path
        end 
    end 

    def new 
      @comment = Comment.new(concert_id: params[:concert_id])
    end 

    def show 
    end 

    def create 
        @comment = Comment.create(comment_params)
        @comment.user = current_user
        if @comment.save 
            redirect_to concert_path(@comment.concert)
        else 
            render :new 
        end 
      end 

      def destroy 
        @comment.delete
        redirect_to concert_path(@comment.concert)
      end 
    
      private
    
      def comment_params
        params.require(:comment).permit(:content, :concert_id)
      end

      def set_comment 
        @comment = Comment.find_by_id(params[:id])
      end 

end
