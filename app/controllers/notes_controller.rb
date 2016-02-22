class NotesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @note = Note.find(params[:id])
    @date = Note.find(params[:id]).day
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to user_path(current_user)
  end

  def index
    @notes = Note.find(current_user)
  end
  
  private
  def note_params
    params.require(:note).permit(:summary)
  end
end
