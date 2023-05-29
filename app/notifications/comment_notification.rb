# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base

  include UsersHelper

  # Add your delivery methods
  deliver_by :database

  # Define helper methods to make rendering easier.
  def type_commentable
    commentableType = params[:comment][:commentable_type]
  end

  def message
    @comment =params[:comment]
    user = user_name(@comment.user_id)
    "comment created on comment #{@comment.id} by #{user}"
  end

    # Define the URL or path for the notification
  def url
    comment_path(params[:comment]) # Replace with the appropriate path helper for your app
  end

end
