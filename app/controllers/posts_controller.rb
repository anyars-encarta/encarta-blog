class PostsController < ApplicationController
    before_action :set_user
  
    def index
      # Action to handle https://users/745/posts
      # Implement logic to fetch all posts for a specific user
      @posts = @user.posts
    end
  
    def show
      # Action to handle https://users/745/posts/3
      # Implement logic to fetch a specific post for a user
      @post = @user.posts.find(params[:id])
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  end
  