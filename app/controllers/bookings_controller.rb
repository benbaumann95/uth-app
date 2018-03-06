class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @ticket = Ticket.find(params[:ticket_id])
    @booking.ticket = @ticket
    @booking.save

    @ticket.sold = true
    @ticket.save
    redirect_to dashboard_path
  end
end
