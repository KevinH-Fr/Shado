module FansHelper
    def user_fan
        if current_user.present?
            if Fan.where(user_id: current_user.id).present?
                Fan.where(user_id: current_user.id).first.id
            end
        end
    end
end
