class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :concert

    def set_price
        self.price = self.category * 7
    end 

    def total_cost 
        self.price * self.quantity
    end 

    def total_with_tax 
        (self.total_cost * 0.06) + self.total_cost
    end 
end
