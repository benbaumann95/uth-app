class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    authorize @ticket
    redirect_to event_path
  end
end
