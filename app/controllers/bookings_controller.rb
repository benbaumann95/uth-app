class BookingsController < ApplicationController
  # creates and saves a booking
  # updates the quantity of tix in event
  # mark ticket as sold
  def create
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @ticket = Ticket.find(params[:ticket_id])
    @booking.ticket = @ticket
    @booking.save

    @event = @ticket.event
    @event.quantity -= 1
    @event.save

    @ticket.sold = true
    @ticket.save

    redirect_to dashboard_path
  end
end
