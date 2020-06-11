module FriendshipsHelper
  def request_sent?(user_id)
    @sent = Friendship.where('(sender_id = ? and receiver_id = ?) OR (receiver_id = ? and sender_id = ?)',
                             current_user.id, user_id, current_user.id, user_id)
    return @sent[0].status if @sent.length.positive?

    'rejected'
  end

  def sender_information(user_id)
    User.find_by(id: user_id)
  end
end
