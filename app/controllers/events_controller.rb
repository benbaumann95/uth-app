class EventsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :new]

  def index
    @watchlist = Watchlist.new
    @watchlists = Watchlist.where(user: current_user)

    if (params[:search] == '')
      @events = policy_scope(Event).where("date_and_time > ?", DateTime.now.midnight - (24/24))
    else
      @events = policy_scope(Event).where("date_and_time > ?", DateTime.now.midnight - (24/24)).search(params[:search])
    end
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

    @event.city = @event.address.split(',')[-2].strip

    @ticket = Ticket.new(ticket_params)
    authorize @ticket

    @ticket.event = @event
    @ticket.user = current_user
    @ticket.display_flag = true
    @ticket.sold = false

    if @ticket.save
      @event.save
      authorize @event

      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.quantity += 1
  end

  def show
    @event = Event.find(params[:id])
    @venue = @event.address.split(',')[0].strip.titleize
    authorize @event
    @tickets = @event.tickets.where("sold = false")
    @booking = Booking.new

    @markers = { lat: @event.latitude, lng: @event.longitude }

  end

  private

  def event_params
    params.require(:event).permit(:name, :quantity, :address, :date_and_time, :category)
  end

  def ticket_params
    params[:event].require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end
end
