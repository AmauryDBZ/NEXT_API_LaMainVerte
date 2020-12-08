class Api::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:destroy, :update, :create]

  # GET /locations
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @locations = Garden.find(params[:garden_id]).location

        render json: @locations
      end
    else
      @garden_types = GardenType.all
      
      render json: @garden_types
    end
  end

  # GET /locations/1
  def show
    @gardens = Garden.where(location: @location)
    render json: {"location" => @location, "country" => @location.country, "gardens" => @gardens}
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location: @api_location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name, :lat, :long, :country_id)
    end

    def is_admin
      if current_user.is_admin
        return true
      else
        render json: {error: "You cannot add/edit/delete a location if you are not an administrator."}, status: :unauthorized
      end
    end
end
