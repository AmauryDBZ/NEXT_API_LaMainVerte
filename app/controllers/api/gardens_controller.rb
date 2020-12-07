class Api::GardensController < ApplicationController
  before_action :set_garden, only: [:show, :update, :destroy]

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
    render json: @garden
  end

  # POST /gardens
  def create
    @garden = Garden.new(garden_params)

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
      params.fetch(:garden, {})
    end
end
