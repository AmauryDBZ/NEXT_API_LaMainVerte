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

    if current_user.follows.length <= 10
      @follows = news_feed_sort
    else
      @follows = new_user_feed
    end

    if params[:follows_page]
      index1 = params[:follows_page].to_i * 10 - 10
      index2 = index1 + 9
      @follows = @follows[index1 .. index2]
    else                           
      @follows = @follows[0..9]
    end

    @selected_users = users_selection

    if params[:selected_users_page]
      index1 = params[:selected_users_page].to_i * 10 - 10
      index2 = index1 + 9
      @selected_users = @selected_users[index1 .. index2]
    else                           
      @selected_users = @selected_users[0..9]
    end
    
    render json: {
      "user" => @user,
      "gardens" => @user.gardens,
      "posts" => @posts.flatten,
      "post_comments" => @user.post_comments,
      "garden_comments" => @user.garden_comments,
      "testimonies" => @user.testimonies,
      "follows" => @follows, 
      "selected_users" => @selected_users,
      "avatar" => @user.avatar_url
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :username, :avatar_url)
  end

  def news_feed_sort
    followed_gardens = Array.new

    @user.follows.each do |follow|
      followed_gardens << follow.garden
    end

    global_scores = Hash.new

    followed_gardens.each do |garden|
      score = garden.likes + garden.garden_comments.length

      garden.posts.each do |post|
        score += post.likes
        score += post.post_comments.length
      end
      
      if Time.now.strftime("%Hh %d/%m/%Y") == garden.updated_at.strftime("%Hh %d/%m/%Y")
        score += 20
      elsif Time.now.strftime("%d/%m/%Y") == garden.updated_at.strftime("%d/%m/%Y") && Time.now.hour - garden.updated_at.hour <= 5
        score += 15
      elsif  Time.now.strftime("%d/%m/%Y") == garden.updated_at.strftime("%d/%m/%Y")
        score += 10
      end
      
      global_scores[garden.id] = score
    end

    followed_gardens = global_scores.sort_by(&:last).reverse

    sorted_gardens = Array.new
    
    followed_gardens.each do |garden|
      sorted_gardens << Garden.find(garden[0])
    end

    return sorted_gardens
  end

  def new_user_feed
    return showed_gardens = Garden.all.sort{|a,b| b.follows.length <=> a.follows.length}
  end

  def users_selection
    selected_users = Array.new
    global_scores = Hash.new

    User.all.each do |user|
      score = 0

      if user != @user
        already_followed = false

        user.gardens.each do |garden|
          garden.follows.each do |follow|
            if follow.user_id = @user.id 
              already_followed = true
            end
          end
        end

        if !already_followed
          user.follows.each do |follow|
            @user.follows.each do |current_user_follow|
              if follow.garden_id == current_user_follow.garden_id
                score += 1
              end

              if Garden.find(current_user_follow.garden_id).garden_type ==  Garden.find(follow.garden_id ).garden_type
                score += 1
              end
            end
          end

          @user.garden_likes.each do |like|
            Garden.find(like.garden_id).tags.each do |liked_tag|
              user.gardens.each do |garden|
                garden.tags.each do |tag|
                  if tag == liked_tag
                    score += 1
                  end
                end
              end
            end
          end
        end

        global_scores[user.id] = score
      end
    end

    selected_users = global_scores.sort_by(&:last).reverse

    sorted_users = Array.new
    
    selected_users.each do |user|
      sorted_users << User.find(user[0])
    end

    return sorted_users
  end

end
