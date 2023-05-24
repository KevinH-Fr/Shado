module AthletesHelper
    def user_athlete
        if current_user.present?
            if Athlete.where(user_id: current_user.id).present?
                Athlete.where(user_id: current_user.id).first.id
            end
        end
    end

    def athlete_full_name
        Athlete.find(user_athlete).name
    end
end
