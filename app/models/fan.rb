class Fan < ApplicationRecord
   # has_many :associations
   # has_many :athletes, through: :associations

   has_many :subscriptions
   has_many :campaigns, through: :subscriptions
   has_many :athletes, through: :campaigns

   belongs_to :user

   has_one_attached :profile_pic


  
end
