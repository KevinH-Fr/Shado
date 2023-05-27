class Comment < ApplicationRecord
  belongs_to :user
  
  belongs_to :commentable, polymorphic: true, inverse_of: :comments
  has_many :comments, as: :commentable, dependent: :destroy

  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 1000

  validates :body, presence: true
  validates :body, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }

  after_create_commit :notify_recipient 
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  # soft delete
  def destroy
    update(deleted_at: Time.zone.now)
  end

  def find_top_parent
    return commentable unless commentable.is_a?(Comment)

    commentable.find_top_parent
  end

  private 

  def notify_recipient 
    CommentNotification.with(comment: self, post: commentable).deliver_later(User.find(5))
    # passer la personne qui recoit la notif en variable 
  end

  def cleanup_notifications 
    notifications_as_comment.destroy_all
  end

end
