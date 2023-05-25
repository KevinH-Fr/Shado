class AssociationsController < ApplicationController
  before_action :set_association, only: %i[ show edit update destroy ]

  def index
    @associations = Association.all
  end

  def show
  end

  def new
    @association = Association.new
    @athlete = Athlete.find(params[:athlete_id])
    @campaigns = @athlete.campaigns
  end

  def edit
    @athlete = Athlete.find(@association.athlete_id)
  end

  def create
    @association = Association.new(association_params)

    respond_to do |format|
      if @association.save
        format.html { redirect_to association_url(@association), notice: "Association was successfully created." }
        format.json { render :show, status: :created, location: @association }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @association.update(association_params)
        format.html { redirect_to association_url(@association), notice: "Association was successfully updated." }
        format.json { render :show, status: :ok, location: @association }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @association.destroy

    respond_to do |format|
      format.html { redirect_to associations_url, notice: "Association was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_association
      @association = Association.find(params[:id])
    end

    def association_params
      params.require(:association).permit(:athlete_id, :fan_id)
    end
end
