class Api::AvatarsController < ApplicationController
    def index
        render json: Picture.all.with_attached_attachment.order(id: :desc)
    end

    def create
    picture = Picture.new(picture_params)

    if picture.save
        render json: picture, status: :created
    else
        render json: picture.errors, status: :unprocessable_entity
    end
    end

    private

    def picture_params
    params.require(:picture).permit(:attachment)
    end
end
