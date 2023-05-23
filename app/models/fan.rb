class Fan < ApplicationRecord
    has_many :associations
    has_many :athletes, through: :associations
  
end
