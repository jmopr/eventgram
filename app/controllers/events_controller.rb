class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
  end

  def create
    if @event = Event.create(event_params)
      flash[:success] = "Your event has been created!"
      redirect_to events_path
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Event updated."
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:photo, :caption)
    end
end
