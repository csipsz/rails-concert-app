class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
    has_many :tickets
    has_many :comments 
    has_many :concerts, through: :tickets

end
