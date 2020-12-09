class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :is_owner_or_admin, only: [:destroy, :update]

  # GET /events
  def index
    if params[:user_id] && params[:garden_id]
      if Garden.find(params[:garden_id]).user_id.to_i != params[:user_id].to_i

        render json: {error: "This garden doesn't exist or wasn't created by this user"}, status: 404
      else 
        @events = Garden.find(params[:garden_id]).events

        render json: @events
      end
    else
      @events = Event.all
      
      render json: @events
    end
  end

  # GET /events/1
  def show
    render json: {"event" => @event, "garden" => @event.garden, "user" => @event.garden.user}
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.garden = Garden.find(params[:garden_id])

    if @event.save
      render json: @event, status: :created, location: @api_event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :date)
    end
    
    def is_owner_or_admin
      if current_user.is_admin || current_user.id == @event.garden.user_id
        return true
      else
        render json: {error: "You cannot edit/create/delete an event if you are not the owner or an administrator."}, status: :unauthorized
      end
    end
end
