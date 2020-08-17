class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :concert
    validates :quantity, inclusion: {in: 1..6}

    def set_price
        self.price = self.category * 7
    end 

    def total_cost 
        self.price * self.quantity
    end 

    def total_with_tax 
        (self.total_cost * 0.06) + self.total_cost
    end 

    def owner 
        self.user.username 
    end 

    def artist 
        self.concert.performer 
    end 

    def venue 
        self.concert.location 
    end 

    def concert_date
        self.concert.date 
    end 


end
