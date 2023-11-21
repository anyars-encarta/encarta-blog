require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_likes_counter' do
    let!(:post) { create(:post) }
    let!(:like) { create(:like, post: post) }

    it 'updates the likes counter for the associated post by 1' do
      expect do
        like.update_likes_counter(post)
      end.to change { post.likes_counter }.by(1)
    end
  end
end
