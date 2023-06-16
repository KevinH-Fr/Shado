class StepsSubscribeController < ApplicationController

  include UsersHelper

  def step1
    @athlete = Athlete.find(params[:athlete])
    @campaign = Campaign.where(athlete_id:  @athlete, periodicity: true).first
    @subscription = Subscription.new
    @fan =  Fan.find(user_role_id(current_user))

  end

  def step2
  end

  def step3
  end

end
