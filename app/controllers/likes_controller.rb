class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = @note.likes.new(get_params)
    byebug
    @like.save
    flash.now[:notice] = "Like."
    redirect_to note_path(@note)
  end

  def destroy
    @note = Note.find(params[:id])
    @like = Like.find_by(note_id: @note.id)
    @like.destroy
    flash[:notice] = "UnLike."
  end

private
  def get_params
    params.permit(:note_id, :user_id)
  end

end
