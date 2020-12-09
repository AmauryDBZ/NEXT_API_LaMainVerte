class Api::CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /countries
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @countries = Garden.find(params[:garden_id]).location.country

        render json: @countries
      end
    else
        @countries = Country.all
        
        render json: @countries
    end

  end

  # GET /countries/1
  def show
    @locations = Location.where(country: @country)
    @gardens = Array.new
    Garden.all.each do |garden|
      if garden.location.country == @country
        @gardens << garden
      end
    end
    

    render json: {"country" => @country, "locations" => @locations, "gardens" => @gardens}
  end

  # POST /countries
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @api_country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:name)
    end

    def is_admin
      if current_user.is_admin
        return true
      else
        render json: {error: "You have to be an administrator to do this stuff"}, status: :unauthorized
      end
    end
end
