class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @ticket = Ticket.new
  end

  def create
    @event = Event.new(event_params)
    @event.save

    @ticket = Ticket.new(ticket_params)
    @ticket.event = @event
    @ticket.user = current_user
    @ticket.display_flag = @ticket.sold = false
    @ticket.save
    raise
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :quantity, :location, :date_and_time, :category)
  end

  def ticket_params
    params[:event].require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end
end
