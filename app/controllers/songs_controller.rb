class SongsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      flash[:errors] = @song.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      flash[:errors] = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  private

  def set_post
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(
        :title, :release_year, :released, :genre, :artist_name
      )
  end

end
