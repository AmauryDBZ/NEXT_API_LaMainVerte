class Api::QueriesController < ApplicationController

  def index
      @results = Hash.new
      @results["users"] = Array.new
      @results["gardens"] = Array.new

    if params[:input]

      User.all.each do |user|
        if user.username.include? params[:input]
          @results["users"] << user
        end
      end

      Garden.all.each do |garden|
        if garden.name.include? params[:input]
          @results["gardens"] << garden 
        end
      end

    end

    render json: @results
  end

end
