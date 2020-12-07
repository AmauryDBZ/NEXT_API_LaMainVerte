class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index

  end

  def show
    render_jsonapi_response(@user)
  end

  def update
    if current_user != @user
      render json: "you cannot edit another user's profile", status: :unauthorized
    else
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user != @user
      render json: "you cannot delete another user's profile", status: :unauthorized
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
