# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #

  def notif_label
    @post = Post.find(params[:comment][:commentable_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.email} commented on #{@post.content.truncate(10)}"
  end
  
  def notif_full
    @post = Post.find(params[:comment][:commentable_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.email} commented on #{@post.content}"
  end

  def message_full
    @comment = Comment.find(params[:comment][:id])
    @content = @comment.body
  end
  
  def url
    post_path(Post.find(params[:comment][:commentable_id]))
  end
end
