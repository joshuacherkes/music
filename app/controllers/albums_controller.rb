class AlbumsController < ApplicationController
  before_filter :signed_in?
  before_filter :is_admin?, :except => :show
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.create!(params[:album])
    redirect_to album_url(@album.id)
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])
    redirect_to album_url(@album.id)

  end

  def destroy
    @album = Album.find_by_id(params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end

end
