class AthletesController < ApplicationController
  before_action :set_athlete, only: %i[ show edit update destroy ]

  def index
    @athletes = Athlete.all

    @fan = Fan.where(user_id: current_user.id).first
    @athletes_suivis = @fan.athletes

  end

  def show
    #@posts =  Post.where(athlete_id: @athlete.id) 
    @posts = @athlete.posts
    @user = User.find(@athlete.user_id) if @user.present?
  end

  def new
    @athlete = Athlete.new
  end

  def edit
  end

  def create
    @athlete = Athlete.new(athlete_params)

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to athlete_url(@athlete), notice: "Athlete was successfully created." }
        format.json { render :show, status: :created, location: @athlete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @athlete.update(athlete_params)
        format.html { redirect_to athlete_url(@athlete), notice: "Athlete was successfully updated." }
        format.json { render :show, status: :ok, location: @athlete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @athlete.destroy

    respond_to do |format|
      format.html { redirect_to athletes_url, notice: "Athlete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    def athlete_params
      params.require(:athlete).permit(:name, :discipline, :bio, :user_id)
    end
end
