# user_controller.rb
class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def index
    @users = User.all

    if can?(:read, @article)
      # Show the article to the user.
    else
      # Redirect the user to the login page.
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      @recent_posts = @user.most_recent_posts
    else
      flash[:alert] = 'User not found'
      redirect_to root_path
    end
  end
end
