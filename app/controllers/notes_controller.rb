class NotesController < ApplicationController
  before_filter :signed_in?

  def new
    @note = Note.new
    render :new
  end

  def edit
    @note = Note.find_by(params[:id])
    render :edit
  end

  def create
    @note = Note.create!(params[:note])
    session.delete(:token)
    redirect_to track_url(@note.track_id)
  end

  def show
    @note = Note.find_by(params[:id])

    redirect_to track_url(@note.track_id)

  end

  def update
    @note = Note.find_by(params[:id])
    @note.update_attributes[params[:note]]
    redirect_to track_url(@note.track_id)
  end



end
