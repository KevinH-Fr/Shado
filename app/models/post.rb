class Post < ApplicationRecord
  belongs_to :athlete

  has_one_attached :image1
  
end
