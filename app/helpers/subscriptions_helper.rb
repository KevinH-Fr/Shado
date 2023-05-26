module SubscriptionsHelper
    def sub_count(campaign)
        Subscription.where(campaign_id: campaign).count
    end

    def sub_current_fan(campaign, fan)
        Subscription.where(campaign_id: campaign, fan_id: fan)
    end
end
