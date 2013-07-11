class TracksController < ApplicationController
    before_filter :signed_in?
    before_filter :is_admin?, :except => :show
  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.create!(params[:track])
    redirect_to track_url(@track.id)
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find_by_id(params[:id])
    @track.update_attributes(params[:track])
    redirect_to track_url(@track.id)
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_url(album)
  end

end
