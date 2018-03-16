class BookingsController < ApplicationController
  # creates and saves a booking
  # updates the quantity of tix in event
  # mark ticket as sold
  def create
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user

    @ticket = Ticket.find(params[:ticket_id])

    if @booking.user != @ticket.user
      @booking.ticket = @ticket

      if @booking.save
        @event = @ticket.event
        @event.quantity -= 1
        @event.save

        @ticket.sold = true
        @ticket.save
        redirect_to dashboard_path(redirect_success: "true")
        UserMailer.ticket_purchased(@ticket).deliver_now
        UserMailer.purchase(current_user, @ticket).deliver_now
      end
    end
  end

  def no_display
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(display_flag: false)
    @booking.save
    redirect_to dashboard_path
  end
end
