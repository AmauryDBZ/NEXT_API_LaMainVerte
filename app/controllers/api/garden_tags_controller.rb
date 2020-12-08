class Api::GardenTagsController < ApplicationController
  before_action :set_garden_tag, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy, :update]
  before_action :can_I_create, only: [:create]


  # GET /garden_tags
  def index
    @garden_tags = GardenTag.all

    render json: @garden_tags
  end

  # GET /garden_tags/1
  def show
    render json: {"garden_tag" => @garden_tag, "tag" => @garden_tag.tag, "garden" => @garden_tag.garden}
  end

  # POST /garden_tags
  def create
    @garden_tag = GardenTag.new(garden_tag_params)
    @garden_tag.garden_id = Garden.find(params[:garden_id]).id

    if @garden_tag.save
      render json: @garden_tag, status: :created, location: @api_garden_tag
    else
      render json: @garden_tag.errors, status: :unprocessable_entity
    end
  end

  
  # PATCH/PUT /garden_tags/1
  def update
    if @garden_tag.update(garden_tag_params)
      render json: @garden_tag
    else
      render json: @garden_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /garden_tags/1
  def destroy
    @garden_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_tag
      @garden_tag = GardenTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def garden_tag_params
      params.require(:garden_tag).permit(:tag_id)
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @garden_tag.garden.user_id
        return true
      else
        render json: {error: "You cannot update/delete a tag if you are not the garden's owner or an administrator."}, status: :unauthorized
      end
    end

    def can_I_create
      if current_user.is_admin || current_user.id == Garden.find(params[:garden_id]).user_id
        return true
      else
        render json: {error: "You cannot create a tag if you are not the garden's owner or an administrator."}, status: :unauthorized
      end
    end
end
