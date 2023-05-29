class PostNotification < Noticed::Base
    deliver_by :database # Store the notification in the database
  
    # Define the recipients of the notification
    def recipients
      User.all # Send the notification to all users
    end
  
    # Define the message content of the notification
    def message
      athlete = Athlete.find(params[:post].athlete_id).name
      "post #{params[:post].id} created by #{athlete}"
    end
  
    # Define the URL or path for the notification
    def url
      post_path(params[:post]) # Replace with the appropriate path helper for your app
    end
  end
  