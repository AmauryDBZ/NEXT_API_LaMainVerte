class Api::GardenLikesController < ApplicationController
  before_action :set_garden_like, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /garden_likes
  def index
    @garden_likes = GardenLike.all

    render json: @garden_likes
  end

  # GET /garden_likes/1
  def show
    render json: {"garden_like" => @garden_like, "garden" => @garden_like.garden, "user" => @garden_like.user}
  end

  # POST /garden_likes
  def create
    @garden_like = GardenLike.new(garden_like_params)
    @garden_like.user_id = current_user.id

    if @garden_like.save
      @liked_garden = Garden.find(@garden_like.garden_id)
      @liked_garden.update(likes: @liked_garden.likes + 1)

      render json: @garden_like, status: :created, location: @api_garden_like
    else
      render json: @garden_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /garden_likes/1
  def update
    if @garden_like.update(garden_like_params)
      render json: @garden_like
    else
      render json: @garden_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /garden_likes/1
  def destroy
    @garden_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_like
      @garden_like = GardenLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def garden_like_params
      params.require(:garden_like).permit(:garden_id)
    end
end
