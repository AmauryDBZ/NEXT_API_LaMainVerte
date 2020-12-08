class Api::PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :update, :destroy]

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

    if @post_comment.save
      render json: @post_comment, status: :created, location: @api_post_comment
    else
      render json: @post_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post_comments/1
  def update
    if @post_comment.update(post_comment_params)
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
end
