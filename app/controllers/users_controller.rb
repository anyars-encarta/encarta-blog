# user_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def login
    @user = User.new
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def show
    if @user
      @recent_posts = @user.most_recent_posts
    else
      flash[:alert] = 'User not found'
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
