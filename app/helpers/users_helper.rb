module UsersHelper
    def user_name(user)
        if user.present?
            if Fan.where(user_id: current_user.id).present?
                Fan.where(user_id: current_user.id).first.pseudo

                
            elsif Athlete.where(user_id: current_user.id).present?
                Athlete.where(user_id: current_user.id).first.name
            end

        end
    end
end
