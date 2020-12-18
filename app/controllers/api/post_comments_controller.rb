class Api::PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy]

  # GET /post_comments
  def index
    if params[:user_id] && params[:garden_id] && params[:post_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @post_comments = []
        @posts = Garden.find(params[:garden_id]).posts
        @posts.each do |post|
          if post.id == params[:post_id].to_i
            @post_comments << post.post_comments
          end
        end

        render json: @post_comments.flatten
      end
    else
      @post_commments = PostComment.all
      
      render json: @post_comments
    end
  end

  # GET /post_comments/1
  def show
    render json: {"post_comment" => @post_comment, "user" => @post_comment.user, "post" => @post_comment.post}
  end

  # POST /post_comments
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = Post.find(params[:post_id]).id

    if @post_comment.save
      render json: @post_comment, status: :created, location: @api_post_comment
    else
      render json: @post_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_comments/1
  def update
    if @post_comment.update(put_comment_params)
      render json: @post_comment
    else
      render json: @post_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_comments/1
  def destroy
    @post_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_comment_params
      params.require(:post_comment).permit(:content)
    end

    def put_comment_params 
      if current_user.id != @post_comment.user_id
        params.require(:post_comment).permit(:warning)
      else
        params.require(:post_comment).permit(:content, :warning)
      end
    end

    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @post_comment.user_id
        return true
      else
        render json: {error: "You cannot edit/delete a comment if you are not its owner or an administrator."}, status: :unauthorized
      end
    end
end
