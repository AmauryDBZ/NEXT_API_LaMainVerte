class Api::FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :update, :destroy]

  # GET /follows
  def index
    if params[:user_id]
      if params[:garden_id]
        if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

          render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
        end
      else
        @follows = User.find(params[:user_id]).follows

        render json: @follows
      end
    else
      @follows = Follow.all
      
      render json: @follows
    end
  end

  # GET /follows/1
  def show
    render json: {"follow" => @follow, "garden" => @follow.garden, "follower" => @follow.user}
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: :created, location: @api_follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /follows/1
  def update
    if @follow.update(follow_params)
      render json: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.fetch(:follow, {})
    end
end
