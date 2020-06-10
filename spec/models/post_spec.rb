require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should_not allow_value(' ').for(:content) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).with_foreign_key(:post_id) }
  end
end