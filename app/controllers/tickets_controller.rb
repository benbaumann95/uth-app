class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def new
    if (params[:search_event].nil? || params[:search_event] == '')
      @events = Event.where("date_and_time >= ?", DateTime.now.midnight - (24/24)).order(date_and_time: :asc)
    else
      @events = Event.where("date_and_time >= ?", DateTime.now.midnight - (24/24)).search(params[:search_event]).sort_by &:date_and_time
    end
    @ticket = Ticket.new
    authorize @ticket

  end

  def add_ticket
    @ticket = Ticket.new
    authorize @ticket
    respond_to do |format|
      format.html
      format.js
    end
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

    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    authorize @ticket
    redirect_to event_path
  end

  def no_display
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.update(display_flag: false)
    @ticket.save
    redirect_to dashboard_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:photo, :event_id, :display_flag, :user_id, :price, :description, :sold)
  end
end
