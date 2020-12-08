class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @users = User.all

    render json: @users
  end

  def show
    @posts = Array.new
    @follows = Array.new
    @user.gardens.each do |garden|
      @posts << garden.posts
    end
    @user.follows.each do |follow|
      @follows << follow.garden
    end

    render json: {
      "user" => @user,
      "gardens" => @user.gardens,
      "posts" => @posts.flatten,
      "post_comments" => @user.post_comments,
      "garden_comments" => @user.garden_comments,
      "testimonies" => @user.testimonies,
      "follows" => @follows
    }
  end

  def update
    if current_user != @user && !current_user.is_admin
      render json: {error: "You cannot edit someone else's account, unless you are an administrator."}, status: :unauthorized
    else
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user != @user && !current_user.is_admin
      render json: {error: "You cannot delete someone else's account, unless you are an administrator."}, status: :unauthorized
    else
      @user.destroy
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
