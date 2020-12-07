class Api::GardenCommentsController < ApplicationController
  before_action :set_garden_comment, only: [:show, :update, :destroy]

  # GET /garden_comments
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @garden_comments = GardenComment.find_by(garden_id: params[:garden_id])

        render json: @garden_comments
      end
    else
      @garden_comments = GardenComment.all
      
      render json: @garden_comments
    end
  end

  # GET /garden_comments/1
  def show
    render json: @garden_comment
  end

  # POST /garden_comments
  def create
    @garden_comment = GardenComment.new(garden_comment_params)

    if @garden_comment.save
      render json: @garden_comment, status: :created, location: @api_garden_comment
    else
      render json: @garden_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /garden_comments/1
  def update
    if @garden_comment.update(garden_comment_params)
      render json: @garden_comment
    else
      render json: @garden_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /garden_comments/1
  def destroy
    @garden_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden_comment
      @garden_comment = GardenComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def garden_comment_params
      params.require(:garden_comment).permit(:content)
    end
end
