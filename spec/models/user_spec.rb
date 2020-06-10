require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
  end

  describe 'associations' do
    it { should have_many(:posts).class_name('Post').with_foreign_key(:user_id) }
    it { should have_many(:comments).class_name('Comment').with_foreign_key(:user_id) }
    it { should have_many(:sent_requests).with_foreign_key(:sender_id).through(:friendship) }
    it { should have_many(:receieved_requests).with_foreign_key(:receiver_id).through(:friendship) }
  end
end
