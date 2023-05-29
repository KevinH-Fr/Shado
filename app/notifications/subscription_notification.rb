class SubscriptionNotification < Noticed::Base
    deliver_by :database # Store the notification in the database
  
  
    # Define the message content of the notification
    def message
      "subscription #{params[:subscription].id} done by "
    end
  
    # Define the URL or path for the notification
    def url
      post_path(params[:subscription]) # Replace with the appropriate path helper for your app
    end
  end
  