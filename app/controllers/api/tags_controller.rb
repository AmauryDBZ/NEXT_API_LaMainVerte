class Api::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    if params[:user_id] && params[:garden_id] && params[:post_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @tags = []
        @posts = Garden.find(params[:garden_id]).posts
        @posts.each do |post|
          if post.id == params[:post_id].to_i
            @tags << post.tags
          end
        end

        render json: @tags.flatten
      end
    else
      @tags = Tag.all
      
      render json: @tags
    end
  end

  # GET /tags/1
  def show
    render json: {"tag" => @tag, "gardens" => @tag.gardens, "posts" => @tag.posts}
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @api_tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
