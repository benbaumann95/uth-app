class WatchlistsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    user = current_user
    @watchlist = Watchlist.new
    @watchlist.event = event
    @watchlist.user = user

    authorize @watchlist
    @watchlist.save(event: event, user: user)



  end

  def destroy

  end
end
