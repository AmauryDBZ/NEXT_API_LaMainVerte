class ClimatesController < ApplicationController
  before_action :set_climate, only: [:show, :update, :destroy]

  # GET /climates
  def index
    @climates = Climate.all

    render json: @climates
  end

  # GET /climates/1
  def show
    render json: @climate
  end

  # POST /climates
  def create
    @climate = Climate.new(climate_params)

    if @climate.save
      render json: @climate, status: :created, location: @climate
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
