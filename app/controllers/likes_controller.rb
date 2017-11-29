class LikesController < ApplicationController
  before_action :prepare_user, :prepare_note

  def create
    @like = @note.likes.save(like_params)
    flash.now[:notice] = "Like."
  end

  def destroy
    @like.destroy
    flash[:notice] = "UnLike."
  end

private
  def like_params
    params.require(:like).permit(:note_id, :user_id)
  end

  def set_like
    @like = Like.find(params[:id])
  end

  def prepare_user
    @user = current_user
  end

  def prepare_note
    @note = Note.find(params[:note_id])
  end

end
