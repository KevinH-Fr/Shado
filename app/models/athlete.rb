class Athlete < ApplicationRecord
    has_many :posts
   # has_many :associations
   # has_many :fans, through: :associations
 
   has_many :campaigns
   has_many :fans, through: :campaigns

   belongs_to :user

end
