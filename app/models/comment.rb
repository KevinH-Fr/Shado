class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  belongs_to :commentable, polymorphic: true, inverse_of: :comments
  has_many :comments, as: :commentable, dependent: :destroy

  def destroy
   update(deleted_at: Time.zone.now)
  end

end
