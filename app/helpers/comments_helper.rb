module CommentsHelper
    def concert_id_field(comment)
        if comment.concert.nil?
          select_tag "comment[concert_id]", options_from_collection_for_select(Concert.all, :id, :performer)
        else
          hidden_field_tag "comment[concert_id]", comment.concert_id
        end
      end
end
