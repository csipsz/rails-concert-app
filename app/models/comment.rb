class Comment < ApplicationRecord
    belongs_to :concert
    belongs_to :user, optional: true
end
