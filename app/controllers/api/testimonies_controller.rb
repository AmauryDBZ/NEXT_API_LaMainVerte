class Api::TestimoniesController < ApplicationController
  before_action :set_testimony, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy, :update]

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
    render json: {"testimony" => @testimony, "user" => @testimony.user}
  end

  # POST /testimonies
  def create
    @testimony = Testimony.new(testimony_params)
    @testimony.user_id = current_user.id

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
      params.require(:testimony).permit(:content, :warning)
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @testimony.user_id
        return true
      else
        render json: {error: "You cannot edit/delete a testimony if you are not its owner or an administrator."}, status: :unauthorized
      end
    end
end
