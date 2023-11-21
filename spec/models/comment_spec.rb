require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  # describe '#update_comments_counter' do
  #   let!(:post) { create(:post) }
  #   let!(:comment) { create(:comment, post:) }

  #   it 'updates the comments counter for the associated post by 1' do
  #     expect do
  #       comment.update_comments_counter(post)
  #     end.to change { post.comments_counter }.by(1)
  #   end
  # end
end
