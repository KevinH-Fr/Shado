class Athlete < ApplicationRecord

    has_many :posts
   # has_many :associations
   # has_many :fans, through: :associations
 
   has_many :campaigns
   has_many :fans, through: :campaigns

   belongs_to :user

   has_one_attached :profile_pic
   has_one_attached :panorama_pic

   def self.ransackable_attributes(auth_object = nil)
    ["bio", "created_at", "discipline", "id", "name", "updated_at", "user_id"]
  end


end
