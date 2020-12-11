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
    @follows = news_feed_sort
 
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
    if current_user.id != @user.id && !current_user.is_admin
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
    if current_user.id != @user.id && !current_user.is_admin
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :username)
  end

  def news_feed_sort
    followed_gardens = Array.new

    @user.follows.each do |follow|
      followed_gardens << follow.garden
    end
    # key = garden.id
    # value = score of the garden
    
    global_scores = Hash.new

    followed_gardens.each do |garden|
      score = garden.likes + garden.garden_comments.length

      garden.posts.each do |post|
        score += post.likes
        score += post.post_comments.length
      end
       
      if  Time.now.strftime("%Hh %d/%m/%Y") == garden.updated_at.strftime("%Hh %d/%m/%Y")
        score += 20
      elsif Time.now.strftime("%d/%m/%Y") == garden.updated_at.strftime("%d/%m/%Y") 

      elsif  Time.now.strftime("%d/%m/%Y") == garden.updated_at.strftime("%d/%m/%Y")
        score += 10
      end
      
      global_scores[garden.id] = score
    end


    # last_updated_gardens = followed_gardens.sort{|a,b| b.updated_at <=> a.updated_at}
    return last_updated_gardens
  end

end
