class Association < ApplicationRecord
  belongs_to :athlete
  belongs_to :fan
end
