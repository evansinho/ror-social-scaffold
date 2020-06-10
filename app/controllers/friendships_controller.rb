class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.create(sender_id: current_user, receiver_id: params[:friend_id], status: "pending")
    flash[:notice] = 'Request sent successfully'
    redirect_to users_path
  end

  def reject
    @request = Friendship.where(current_user, params[:sender_id])
    @request.destroy
    redirect_to received_requests_path
  end

  def accept
    @request = Friendship.where(current_user, params[:sender_id])
    @request.update(status: 'accepted')
    Friendship.create(sender_id: current_user.id,
                      receiver_id: params[:sender_id], status: 'accepted')
    redirect_to received_requests_path
  end

end
