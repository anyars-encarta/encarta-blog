class PostsController < ApplicationController
  before_action :set_user

  def index
    # Action to handle https://users/745/posts
    @posts = @user.posts.includes(:author)
  end

  def show
    # Action to handle https://users/745/posts/3
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    # @posts = @user.posts
    @post_index = @user.posts.index(@post)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
