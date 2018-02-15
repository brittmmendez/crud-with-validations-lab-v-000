class SongsController < ApplicationController

  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
  end

  def new
    @song=Song.new
  end

  def create
      @song=Song.new(song_params(:title, :release_year, :released, :genre, :artist_name))
      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :new
      end
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
    @song=Song.find(params[:id])
    if @song.update(song_params(:title, :release_year, :released, :genre, :artist_name))
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def delete
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
