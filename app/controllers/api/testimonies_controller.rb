class Api::TestimoniesController < ApplicationController
  before_action :set_testimony, only: [:show, :update, :destroy]

  # GET /testimonies
  def index
    if params[:user_id] 
      @testimonies = User.find(params[:user_id]).testimonies

      render json: @testimonies
    else
      @testimonies = Testimony.all
      
      render json: @testimonies
    end
  end

  # GET /testimonies/1
  def show
    render json: @testimony
  end

  # POST /testimonies
  def create
    @testimony = Testimony.new(testimony_params)

    if @testimony.save
      render json: @testimony, status: :created, location: @api_testimony
    else
      render json: @testimony.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /testimonies/1
  def update
    if @testimony.update(testimony_params)
      render json: @testimony
    else
      render json: @testimony.errors, status: :unprocessable_entity
    end
  end

  # DELETE /testimonies/1
  def destroy
    @testimony.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimony
      @testimony = Testimony.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def testimony_params
      params.require(:testimony).permit(:content)
    end
end
