class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
    @fan = Fan.find_by(user_id: current_user.id)
    
    if @fan
      @athletes = @fan.athletes
      @posts_suivis = Post.where(athlete_id: @athletes.pluck(:id))
    else
      @posts_suivis = []
    end
  end

  def show
  end

  def new
    @post = Post.new
    @athlete = Athlete.where(user_id: current_user.id).first

    # tempo alternative athlete ou fan
    unless @athlete.present?
      @fan = Fan.where(user_id: current_user.id).first
    end

  end

  def edit
    @athlete = Athlete.where(user_id: current_user.id).first
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :location, :content, :athlete_id, :fan_id, :image1, :file)
    end
end