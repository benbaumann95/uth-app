class WatchlistsController < ApplicationController

  def create
    on_watch = Watchlist.where("event_id = ?", params[:event_id]).exists?

    if on_watch
      event_id = Watchlist.where("event_id = ?", params[:event_id]).first.id
      @watched_event = Watchlist.find(event_id)
      authorize @watched_event
      @watched_event.destroy
    else
      event = Event.find(params[:event_id])
      user = current_user
      @watchlist = Watchlist.new
      @watchlist.event = event
      @watchlist.user = user

      authorize @watchlist
      @watchlist.save(event: event, user: user)
    end
  end

  def destroy

  end
end
