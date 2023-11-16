require './rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:photo) }
      it { should validate_presence_of(:bio) }
      it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
    end
  
    describe 'associations' do
      it { should have_many(:posts).dependent(:destroy) }
      it { should have_many(:comments).through(:posts) }
      it { should have_many(:likes).through(:posts) }
    end
  
    describe '#recent_posts' do
      let!(:user) { create(:user) }
      let!(:recent_posts) { create_list(:post, 5, user: user) }
  
      it 'returns the 3 most recent posts' do
        expect(user.recent_posts).to eq(recent_posts.last(3).reverse)
      end
    end
  end