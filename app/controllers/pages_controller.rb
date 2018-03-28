class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :home]

  def about
  end

  def dashboard
    @tickets = current_user.tickets.where("display_flag = true")
    @bookings = current_user.bookings
    @watchlists = current_user.watchlists
    @number_listings = current_user.tickets.all.count
    @number_purchases = current_user.bookings.all.count
    @number_watching = current_user.watchlists.all.count

    @upcoming_tickets = Event.order(date_and_time: :desc)
  end

  def ticket_file
  end

  def profile
  end

  def home
    @watchlist = Watchlist.new
    @watchlists = Watchlist.where(user: current_user)

    @cities = ["Bristol", "Manchester", "London", "Leeds", "Newcastle", "Sheffield"]
    # @cities = Event.distinct.pluck(:city)[0..5]
    @categories = [
    "Club night",
    "Concert",
    "Festival",
    "Travel",
    "Sport",
    "Society",
    "Socials"
    ]
    @upcoming_events = policy_scope(Event).where("date_and_time > ?", DateTime.now.midnight - (24/24)).order(date_and_time: :asc).limit(6)
  end
end
