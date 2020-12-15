class Api::AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin

    def index
        render json: {
            "users" => User.where(warning: true),
            "gardens" => Garden.where(warning: true),
            "posts" => Post.where(warning: true),
            "gardens_comments" => GardenComment.where(warning: true),
            "post_comments" => PostComment.where(warning: true),
            "testimonies" => Testimony.where(warning: true),
            "events" => Event.where(warning: true)
        }
    end

    private

    def is_admin
        if current_user.is_admin
          return true
        else
          render json: {error: "You have to be an administrator to do this stuff"}, status: :unauthorized
        end
      end
end
