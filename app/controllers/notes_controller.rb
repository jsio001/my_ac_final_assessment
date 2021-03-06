class NotesController < ApplicationController
  before_action :authenticate_user!, :prepare_user
  before_action :set_note, except: [:new, :create, :index]

  def show
  end

  def index
    @notes = @user.notes.all
    if user_signed_in?
      @following = current_user.posters
      @tofollow = User.all.reject{|user| user == current_user} - @following
    else
      @following = User.all
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = @user.notes.new(note_params)
    if @note.save
      flash[:notice] = "Note added."
      redirect_to root_path
    else
      flash.now[:alert] = "Note is invalid."
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      flash[:notice] = "Note updated."
      redirect_to root_path
    else
      flash.now[:alert] = "Update is invalid."
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = "Note deleted."
    redirect_to root_path
  end

private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def prepare_user
    @user = current_user
  end

end
