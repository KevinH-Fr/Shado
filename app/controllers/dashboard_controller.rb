class DashboardController < ApplicationController
  def index
    @athlete = Athlete.where(user_id: current_user.id).first

    @campaigns = @athlete.campaigns

    @followers = @athlete.fans.uniq

    @subscriptions = @athlete.campaigns.joins(:subscriptions)

    @valSubscriptions = @subscriptions.sum(:brut)

    @valSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').sum('brut')
    @nbSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').count
  end
end
