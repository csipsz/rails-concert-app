class Concert < ApplicationRecord
    belongs_to :artist
    has_many :tickets, :dependent => :destroy
    has_many :users, through: :tickets
    has_many :comments 
    accepts_nested_attributes_for :comments


    validates :artist_id, :location, :date, :capacity, presence: true
    validates :location, uniqueness: { scope: %i[artist_id]}

    scope :order_by_name, -> {order(:artist_id)}
    scope :search_by_location, -> (chosen_location){where("location = ?", chosen_location)}

    def remaining_tickets 
        self.tickets.each do |ticket| 
            self.capacity -= ticket.quantity
        end 
        self.capacity 
    end 

    def concert_info 
        "#{self.artist.artist_name} - #{self.location}"
    end 

    def attendees
        self.users.map{|u| u.username}.uniq
    end 

    def performer 
        self.artist.artist_name
    end 

end
