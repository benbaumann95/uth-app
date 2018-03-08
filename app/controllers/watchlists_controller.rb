class WatchlistsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    user = current_user
    @watchlist = Watchlist.new
    @watchlist.event = event
    @watchlist.user = user

    authorize @watchlist
    Watchlist.create(event: event, user: user)


    redirect_to events_path
  end

  def destroy

  end
end
