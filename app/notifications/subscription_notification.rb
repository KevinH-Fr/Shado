class SubscriptionNotification < Noticed::Base
    deliver_by :database # Store the notification in the database
  
    # Define the message content of the notification
    def message
      subsrcriber = Fan.find(params[:subscription].fan_id)

      "subscription #{params[:subscription].id} done by  #{subsrcriber.pseudo}"
    end
  
    # Define the URL or path for the notification
    def url
      subscription_path(params[:subscription]) 
    end
  end
  