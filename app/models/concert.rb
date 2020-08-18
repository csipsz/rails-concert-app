class Concert < ApplicationRecord
    has_many :tickets
    has_many :comments 
    has_many :users, through: :tickets

    validates :performer, :location, :date, presence: true
    validates :location, uniqueness: { scope: %i[performer]}

    scope :order_by_name, -> {order(:performer)}
    scope :search_by_location, -> (chosen_location){where("location = ?", chosen_location)}

    def remaining_tickets 
        self.tickets.each do |ticket| 
            self.capacity -= ticket.quantity
        end 
        self.capacity 
    end 

    def concert_info 
        "#{self.performer} - #{self.location}"
    end 

    def attendees
        self.users.map{|u| u.username}.uniq
    end 
end
