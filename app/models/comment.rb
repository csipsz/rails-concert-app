class Comment < ApplicationRecord
    belongs_to :concert
    belongs_to :user, optional: true
    belongs_to :artist, optional: true
    validates :content, length: {minimum: 3}

    def commenter_artist 
        self.concert.artist.artist_name
    end 

    def commenter_user 
        self.user ? self.user.username : nil
    end 

    def commenter 
        commenter_user ? commenter_user : commenter_artist
    end 

end
