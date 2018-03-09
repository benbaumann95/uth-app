class EventsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :new]

  def index

    @watchlist = Watchlist.new
    @events = policy_scope(Event)
    # .where("quantity > 0")

    if !params[:search_category].nil?
      # @events = policy_scope(Event).search(params[:search])
      @events = policy_scope(Event).where("category = ?", params[:search_category])
    elsif !params[:search_city].nil?
      @events = policy_scope(Event).where("city = ?", params[:search_city])
    elsif !params[:search].nil?
      @events = policy_scope(Event).search(params[:search])
    else
      @events = policy_scope(Event).where("date_and_time > ?", DateTime.now)
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

    # @watchlists = Watchlist.where(user: current_user)

    # event = Watchlist.find(event.id)

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
