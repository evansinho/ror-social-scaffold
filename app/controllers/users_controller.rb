class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_friends(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def invite
    @requests = Friendship.where('receiver_id = ? and status = ?', current_user.id, 'pending')
  end
end
