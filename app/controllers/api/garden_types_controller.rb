class Api::GardenTypesController < ApplicationController
  before_action :set_garden_type, only: [:show, :update, :destroy]

  # GET /garden_types
  def index
    if params[:garden_id]
      @garden_types = Garden.find(params[:garden_id]).garden_type
    else
      @garden_types = GardenType.all
    end

    render json: @garden_types
  end

  # GET /garden_types/1
  def show
    render json: @garden_type
  end

  # POST /garden_types
  def create
    @garden_type = GardenType.new(garden_type_params)

    if @garden_type.save
      render json: @garden_type, status: :created, location: @api_garden_type
    else
      render json: @garden_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /garden_types/1
  def update
    if @garden_type.update(garden_type_params)
      render json: @garden_type
    else
      render json: @garden_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /garden_types/1
  def destroy
    @garden_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_type
      @garden_type = GardenType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def garden_type_params
      params.require(:garden_type).permit(:name)
    end
end
