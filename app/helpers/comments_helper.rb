module CommentsHelper

    def concert_id_field(comment)
        if comment.concert.nil?
          select_tag "comment[concert_id]", options_from_collection_for_select(Concert.all, :id, :concert_info)
        else
          hidden_field_tag "comment[concert_id]", comment.concert_id
        end
      end

    def show_delete(comment) 
        if comment.user == current_user
            button_to "Delete Comment", comment_path(comment), method: :delete
        end
    end 

end
