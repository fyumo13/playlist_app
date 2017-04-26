class PlaylistsController < ApplicationController
  # adds song to playlist
  def create
    Playlist.create(song_id: params[:song], user: current_user)
    redirect_to "/songs"
  end
end
