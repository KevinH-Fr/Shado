class Athlete < ApplicationRecord
    has_many :posts

    has_many :associations
    has_many :fans, through: :associations
 
end
