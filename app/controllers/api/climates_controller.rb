class Api::ClimatesController < ApplicationController
  before_action :set_climate, only: [:show, :update, :destroy]

  # GET /climates
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @climate = Garden.where(user_id: params[:user_id]).find(params[:garden_id]).climate

        render json: @climate
      end
    else
        @climates = Climate.all

        render json: @climates
    end
  end

  # GET /climates/1
  def show
    @gardens = Garden.where(climate: @climate)

    render json: {"climate" => @climate, "gardens" => @gardens}
  end

  # POST /climates
  def create
    @climate = Climate.new(climate_params)

    if @climate.save
      render json: @climate, status: :created, location: @api_climate
    else
      render json: @climate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /climates/1
  def update
    if @climate.update(climate_params)
      render json: @climate
    else
      render json: @climate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /climates/1
  def destroy
    @climate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climate
      @climate = Climate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def climate_params
      params.require(:climate).permit(:name)
    end
end
