class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def about
  end
  def dashboard
    @tickets = current_user.tickets
    @bookings = current_user.bookings
  end

end
