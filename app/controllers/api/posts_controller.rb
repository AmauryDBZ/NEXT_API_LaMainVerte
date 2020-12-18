class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy]
  # GET /posts
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @posts = Garden.find(params[:garden_id]).posts

        render json: @posts
      end
    else
      @posts = Post.all
      render json: @posts
    end
  end

  # GET /posts/1
  def show

    render json: {
      "post" => @post,
      "user" => @post.garden.user, 
      "garden" => @post.garden, 
      "tags" => @post.tags,
      "comments" => @post.post_comments,
      "likes" => @post.post_likes
    }
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.garden_id = Garden.find(params[:garden_id]).id

    if @post.save
      @post.garden.update(updated_at: Time.now)
      render json: @post, status: :created, location: @api_post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(put_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :content, pictures_url: [ ])
    end

    def put_params
      if current_user.id != @post.garden.user_id 
        params.require(:post).permit(:warning)
      else
        params.require(:post).permit(:title, :content, :warning, pictures_url: [ ])
      end
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @post.garden.user_id
        return true
      else
        render json: {error: "You cannot edit/delete a post if you are not the owner or an administrator."}, status: :unauthorized
      end
    end
end
