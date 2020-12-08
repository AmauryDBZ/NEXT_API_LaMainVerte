class Api::PostTagsController < ApplicationController
  before_action :set_post_tag, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy, :update]
  before_action :can_I_create, only: [:create]

  # GET /post_tags
  def index
    if params[:user_id] && params[:garden_id] && params[:post_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @post_tags = []
        @posts = Garden.find(params[:garden_id]).posts
        @posts.each do |post|
          if post.id == params[:post_id].to_i
            @post_tags << post.post_tags
          end
        end

        render json: @post_tags.flatten
      end
    else
      @post_tags = PostTag.all
      
      render json: @post_tags
    end
  end

  # GET /post_tags/1
  def show
    render json: {"post_tag" => @post_tag, "tag" => @post_tag.tag, "post" => @post_tag.post}
  end

  # POST /post_tags
  def create
    @post_tag = PostTag.new(post_tag_params)
    @post_tag.post_id = Post.find(params[:post_id]).id

    if @post_tag.save
      render json: @post_tag, status: :created, location: @api_post_tag
    else
      render json: @post_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_tags/1
  def update
    if @post_tag.update(post_tag_params)
      render json: @post_tag
    else
      render json: @post_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_tags/1
  def destroy
    @post_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_tag
      @post_tag = PostTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_tag_params
      params.require(:post_tag).permit(:tag_id)
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @post_tag.post.garden.user_id
        return true
      else
        render json: {error: "You cannot update/delete a tag if you are not the post's owner or an administrator."}, status: :unauthorized
      end
    end

    def can_I_create
      if current_user.is_admin || current_user.id == Post.find(params[:post_id]).garden.user_id
        return true
      else
        render json: {error: "You cannot add a tag if you are not the post's owner or an administrator."}, status: :unauthorized
      end
    end
end
