class StepsSubscribeController < ApplicationController

  def step1
    @athlete = Athlete.find(params[:athlete])
    @campaign = Campaign.where(athlete_id:  @athlete, periodicity: true).first

  end

  def step2
  end

end
