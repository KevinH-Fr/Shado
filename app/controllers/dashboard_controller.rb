class DashboardController < ApplicationController
  def index
    
  end
  
  def activities
    @athlete = Athlete.where(user_id: current_user.id).first
    @followers = @athlete.fans.uniq

        
    @subscriptions = @athlete.campaigns.joins(:subscriptions)
    
    @valSubscriptions = @subscriptions.sum(:brut)
    
    @valSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').sum('brut')
    @nbSubByDate = @subscriptions.group('DATE(subscriptions.created_at)').count

    
  end

  def revenues
  end

  def monetization
    @athlete = Athlete.where(user_id: current_user.id).first
    @campaigns = @athlete.campaigns

  end

  def guides
  end

end
