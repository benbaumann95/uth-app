class EventsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :new]

  def index
    @events = policy_scope(Event).where("quantity > 0")
  end

  def new
    @event = Event.new
    @ticket = Ticket.new
    authorize @event
    authorize @ticket
  end

  def create
    @event = Event.new(event_params)
    @event.quantity = 1
    @event.save
    authorize @event

    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    @ticket.event = @event
    @ticket.user = current_user
    @ticket.display_flag = true
    @ticket.sold = false
    @ticket.save

    redirect_to root_path
  end

  def update
    @event = Event.find(params[:id])
    @event.quantity += 1
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @tickets = @event.tickets.where("sold = false")
    @booking = Booking.new
  end

  private

  def event_params
    params.require(:event).permit(:name, :quantity, :location, :date_and_time, :category)
  end

  def ticket_params
    params[:event].require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end
end
