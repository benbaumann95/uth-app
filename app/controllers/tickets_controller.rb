class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def new
    if params[:search_event] != nil
      @events = Event.search(params[:search_event])
      # dont display past events
      # breaking when submitting with errors
    end
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    @event = Event.find(params[:event_id])
    @ticket.event = @event
    @ticket.user = current_user
    @ticket.display_flag = true
    @ticket.sold = false

    if @ticket.save
      @event.quantity += 1
      @event.save
      redirect_to event_path(@event.id)
    else
      render 'tickets/new'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    authorize @ticket
    redirect_to event_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end
end
