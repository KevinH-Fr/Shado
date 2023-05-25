class DashboardController < ApplicationController
  def index
    @athlete = Athlete.where(user_id: current_user.id).first

    @campaigns = @athlete.campaigns

    @followers = @athlete.fans
    
  end
end
