class Api::PostLikesController < ApplicationController
  before_action :set_post_like, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:update]

  # GET /post_likes
  def index
    @post_likes = PostLike.all

    render json: @post_likes
  end

  # GET /post_likes/1
  def show
    render json: @post_like
  end

  # POST /post_likes
  def create
    @post_like = PostLike.new(post_like_params)
    @post_like.user_id = current_user.id

    if @post_like.save
      @liked_post = Post.find(@post_like.post_id)
      @liked_post.update(likes: @liked_post.likes + 1)

      render json: @post_like, status: :created, location: @api_post_like
    else
      render json: @post_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_likes/1
  def update
    if @post_like.update(post_like_params)
      render json: @post_like
    else
      render json: @post_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_likes/1
  def destroy
    @post_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_like
      @post_like = PostLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_like_params
      params.require(:post_like).permit(:post_id)
    end

    def is_admin
      if current_user.is_admin
        return true
      else
        render json: {error: "You cannot edit a like if you are not an administrator."}, status: :unauthorized
      end
    end
end
