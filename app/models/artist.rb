class Artist < ApplicationRecord
    has_many :concerts 
    has_many :comments 
    has_many :tickets, through: :concerts
    has_secure_password
    validates :artist_name, presence: true, uniqueness: true

end
