require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  # describe '#update_likes_counter' do
  #   let!(:user) { create(:user) }
  #   let!(:post) { create(:post, author: user) }
  #   let!(:like) { create(:like, user: user, post: post) }

  #   it 'updates the likes counter for the associated post by 1' do
  #     expect do
  #       like.update_likes_counter(post)
  #     end.to change { post.reload.likes_counter }.by(1)
  #   end
  # end
end
