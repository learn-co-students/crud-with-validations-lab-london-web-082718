class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      @song.save
      # byebug
      redirect_to song_path(@song)
    else
      render :new
  end
end

  def update
    set_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
  end
end

  def destroy
    set_song.destroy
    redirect_to songs_path
  end


  private

  def song_params
     params.require(:song).permit(:title, :released, :artist_name, :genre, :release_year)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end
