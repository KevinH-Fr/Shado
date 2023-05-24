class Post < ApplicationRecord
  belongs_to :athlete
  has_one_attached :image1
  has_one_attached :file
  
  acts_as_votable
end
