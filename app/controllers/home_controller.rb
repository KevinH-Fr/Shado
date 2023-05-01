class HomeController < ApplicationController
  def index
    @athlete=Athlete.where(user_id:current_user.id)
  end
end
