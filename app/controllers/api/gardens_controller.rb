class Api::GardensController < ApplicationController
  before_action :set_garden, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy, :update]

  # GET /gardens
  def index
    if params[:user_id]
      @gardens = User.find(params[:user_id]).gardens
    else
      @gardens = Garden.all
    end

    render json: @gardens
  end

  # GET /gardens/1
  def show
    @followers = Array.new

    Follow.all.each do |follow|
      if follow.garden == @garden
        @followers << follow.user
      end
    end


    render json: {
      "garden" => @garden,
      "user" => @garden.user,
      "followers" => @followers,
      "follows" => @garden.follows,
      "posts" => @garden.posts,
      "type" => @garden.garden_type,
      "events" => @garden.events,
      "comments" => @garden.garden_comments,
      "climate" => @garden.climate,
      "location" => @garden.location,
      "country" => @garden.location.country,
      "likes" => @garden.garden_likes
    }
  end

  # POST /gardens
  def create
    @garden = Garden.new(garden_params)
    @garden.user_id = current_user.id
    
    if @garden.save
      render json: @garden, status: :created, location: @api_garden
    else
      render json: @garden.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gardens/1
  def update
    if @garden.update(garden_params)
      render json: @garden
    else
      render json: @garden.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gardens/1
  def destroy
    @garden.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = Garden.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def garden_params
      params.require(:garden).permit(:area, :location_id, :climate_id, :garden_type_id, :name)
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @garden.user_id
        return true
      else
        render json: {error: "You cannot edit/delete a garden if you are not the owner or an administrator."}, status: :unauthorized
      end
    end
end
