class BandsController < ApplicationController
  before_filter :signed_in?
  before_filter :is_admin?, :except => :show
  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.create!(params[:band])
    redirect_to band_url(@band.id)
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find_by_id(params[:id])
    @band.update_attributes(params[:band])
    redirect_to band_url(@band.id)
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    album = @band.albums.first
    @band.destroy
    redirect_to album_url(album)
  end
end
