class HomeController < ApplicationController

  include UsersHelper 

  def index
    @athlete = Athlete.where(user_id: current_user)
    
    if user_role(current_user.id) == "fan" 
      @partial_role = 'fan_infos'
      @fan = Fan.find(user_role_id(current_user))
      @athletes = @fan.athletes.distinct
    elsif user_role(current_user) == "athlete" 
      @partial_role = 'athlete_infos'
    end

  end
end
