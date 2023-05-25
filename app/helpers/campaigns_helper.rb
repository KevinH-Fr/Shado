module CampaignsHelper
    def campaign_label(campaign)
        if campaign == false
            "Annuelle"
        else 
            "Ponctuelle"
        end
    end
end
