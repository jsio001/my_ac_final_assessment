class PagesController < ApplicationController
  def home
    if user_signed_in?
      @following = current_user.posters
      @tofollow = User.all.reject{ |user| user.id == current_user.id } - @following
    else
      @following = User.all
    end
  end

  def relate
    @follow = Relation.new(subscriber_id: current_user.id, poster_id: params[:id])
    if @follow.save
      flash[:notice] = "Now following."
      redirect_to root_path
    else
      flash[:error] = "Unable to follow user."
      redirect_to root_path
    end
  end

  def unrelate
    @follow = Relation.find_by(subscriber_id: current_user.id, poster_id: params[:poster_id])
    if @follow != nil && @follow.destroy
      flash[:notice] = "Unfollowed."
      redirect_to root_path
    else
      flash[:alert] = "Unable to unfollow user."
      redirect_to root_path
    end
  end

end
