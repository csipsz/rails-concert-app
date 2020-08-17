class Comment < ApplicationRecord
    belongs_to :concert
    belongs_to :user, optional: true
    validates :content, length: {minimum: 3}
end
