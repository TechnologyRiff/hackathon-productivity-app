class NotesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to user_path(current_user)
  end

  def index
  end
  
  private
  def note_params
    params.require(:note).permit(:summary)
  end
end
