class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :home]

  def about
  end

  def dashboard
    @tickets = current_user.tickets
    @bookings = current_user.bookings
    @watchlists = current_user.watchlists
    @number_listings = current_user.tickets.all.count
    @number_purchases = current_user.bookings.all.count
    @number_watching = current_user.watchlists.all.count
  end

  def ticket_file
  end

  def profile
  end

  def home
    # @events = policy_scope(Event)
    @cities = Event.distinct.pluck(:city)
    @categories = Event.distinct.pluck(:category)
  end
end
