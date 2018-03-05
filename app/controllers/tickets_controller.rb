class TicketsController < ApplicationController
  def new
    @event = Event.new
    @ticket = Ticket.new
  end

  def create
    @event = Event.new(event_params)
    @event.create
    @ticket = Ticket.new(ticket_params)
    @ticket.event = @event
    @ticket.user = current_user
    @ticket.create
  end

  private

  def ticket_params
    params.require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end

  def event_params
    params.require(:event).permit(:name, :quantity, :location, :date, :start_time, :end_time, :category)
  end
end
