class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.out_friend_id = current_user.id
    @friendship.save!

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { render :json => @friendship }
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy!

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { render :json => @friendship }
    end
  end


  private

  def friendship_params
    params.require(:friendship).permit(:in_friend_id)
  end
end
