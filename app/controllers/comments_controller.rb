class CommentsController < ApplicationController

    def index 
        if params[:concert_id]
            @comments = Concert.find(params[:concert_id]).comments
          else
            @comments = Comment.all
        end 
    end 

    def new 
        @comment = Comment.new(concert_id: params[:concert_id])
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
    
      private
    
      def comment_params
        params.require(:comment).permit(:content, :concert_id)
      end

end
