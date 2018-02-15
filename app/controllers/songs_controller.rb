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
    
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
  end

  def delete
  end

  private
  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
