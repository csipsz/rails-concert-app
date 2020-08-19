module CommentsHelper

    def concert_id_field(comment)
        if comment.concert.nil?
          select_tag "comment[concert_id]", options_from_collection_for_select(Concert.all, :id, :concert_info)
        else
          hidden_field_tag "comment[concert_id]", comment.concert_id
        end
      end

    def show_delete(comment) 
        if current_user && current_user == comment.user
            add_button(comment)
        elsif current_artist && comment.concert.artist == current_artist && comment.user == nil
            add_button(comment)
        end
    end 

    def add_button(comment)
      button_to "Delete Comment", comment_path(comment), method: :delete
    end 

    def pretty_time(comment)
        comment.created_at.strftime("On %A, %d %b %Y, at %l:%M %p")
    end 

end
