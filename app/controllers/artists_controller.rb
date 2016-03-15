class ArtistsController < ApplicationController
  # index
  def index
    @artists = Artist.all
  end

  # new
  def new
    return unless authorized
    @artist = Artist.new
  end

  # create
  def create
    return unless authorized
    @artist = Artist.create!(artist_params)

    redirect_to @artist
  end

  #show
  def show
    @artist = Artist.find(params[:id])
  end

  # edit
  def edit
    return unless authorized
    @artist = Artist.find(params[:id])
  end


  # update
  def update
    return unless authorized
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)

    redirect_to @artist
  end

  # destroy
  def destroy
    return unless authorized
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
