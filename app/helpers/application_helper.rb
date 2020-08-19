module ApplicationHelper

    def shared_links 
        if logged_in? || logged_in_as_artist?
            link_to(" LOGOUT ", logout_path, method: :delete) + link_to(" CONCERTS (っ•́｡•́)♪♬ ", concerts_path) + link_to(" SEE ARTISTS ", artists_path)
        end 
    end 

    def user_only_links
        if logged_in?
            link_to(" ADD COMMENT ", new_comment_path) + link_to(" BOOK TICKET ", new_ticket_path) + link_to("MY TICKETS ", user_tickets_path(current_user))
        end
    end 

    def artist_only_links
        if logged_in_as_artist? 
            link_to(" CREATE CONCERT ", new_concert_path) + link_to(" MY PROFILE ", artist_path(current_artist))
        end
    end

end
