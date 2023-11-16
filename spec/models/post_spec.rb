require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_most(250) }
      it { should validate_presence_of(:text) }
      it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
      it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
    end
  
    describe 'associations' do
      it { should belong_to(:user) }
      it { should have_many(:comments).dependent(:destroy) }
      it { should have_many(:likes).dependent(:destroy) }
      it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    end
  
    describe '#update_posts_counter' do
      let!(:user) { create(:user) }
      let!(:post) { create(:post, user: user) }
  
      it 'updates the posts counter for the associated user by 1' do
        expect {
          post.update_posts_counter(user)
        }.to change { user.posts_counter }.by(1)
      end
    end

    describe '#recent_comments' do
    let!(:post) { create(:post) }
    let!(:recent_comments) { create_list(:comment, 7, post: post) }

    it 'returns the 5 most recent comments' do
      expect(post.recent_comments).to eq(recent_comments.last(5).reverse)
    end
  end
end