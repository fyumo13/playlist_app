class SongsController < ApplicationController
  # displays a list of songs the user can add to his/her playlist
  # also displays form that allows user to add his/her own song
  def index
    @user = User.find(session[:user_id])
    @songs = Song.order(created_at: :desc)
  end

  # creates a new song with valid attributes
  def create
    @song = Song.new(song_params)
    if !@song.save
      flash[:errors] = @song.errors.full_messages
    end
    redirect_to "/songs"
  end

  # displays page with info on a particular song
  def show
    @song = Song.find(params[:id])
    @users = @song.users.distinct
  end

  private
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
