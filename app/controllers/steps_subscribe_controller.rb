class StepsSubscribeController < ApplicationController

  include UsersHelper

  def step1
    @athlete = Athlete.find(params[:athlete])
    @campaign = Campaign.where(athlete_id:  @athlete, periodicity: true).first

  end

  def step2
    @athlete = Athlete.find(params[:athlete])
    @campaign = Campaign.where(athlete_id:  @athlete, periodicity: true).first
    @subscription = Subscription.new
    @fan =  Fan.find(user_role_id(current_user))

    @remuneration = AdminParameter.first.remuneration

    @totalPrice = @campaign.subscription
    @platformFees = @totalPrice * ( @remuneration.to_f / 100)
    @paymentFees = @totalPrice * ( 1.5 / 100)

    @netAthlete = @totalPrice - @platformFees - @paymentFees

   

  end

  def step3
  end

end
