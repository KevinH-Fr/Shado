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
  

  def type_commentable
    commentableType = params[:comment][:commentable_type]
  end

  def url
    commentableType = params[:comment][:commentable_type]
    commentable = params[:comment][:commentable_id]
    comment = params[:comment]

    if commentableType == "Post"
      post_path(commentable)
    elsif commentableType == "Comment"
      comment_path(comment)
    end
  end

  def notif_full
    
    commentableType = params[:comment][:commentable_type]
    commentable = params[:comment][:commentable_id]

    if commentableType == "Post"

      @post = Post.find(commentable)
      @comment = Comment.find(params[:comment][:id])
      @user = User.find(@comment.user_id)
      "#{@user.email} commented on #{@post.content}"

    elsif commentableType == "Comment"

      @comment = params[:comment]
      @user = User.find(@comment.user_id)
      "#{@user.email} commented on #{@comment.body}"

    end 
  end
  
end
