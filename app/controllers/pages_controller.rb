class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def about
  end
  def dashboard
    @tickets = current_user.tickets
    @bookings = current_user.bookings
    @number_listings = current_user.tickets.all.count
    @number_purchases = current_user.bookings.all.count
  end
  def ticket_file
  end
end
