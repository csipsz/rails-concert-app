class Concert < ApplicationRecord
    has_many :tickets
    has_many :comments 
    has_many :users, through: :tickets

    scope :order_by_name, -> {order(:performer)}
    scope :search_by_location, -> (chosen_location){where("location = ?", chosen_location)}

    def remaining_tickets 
        self.tickets.each do |ticket| 
            self.capacity -= ticket.quantity
        end 
        self.capacity 
    end 
end
