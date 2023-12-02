class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end
  
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(@user), notice: 'Comment created!'
    else
      flash.now[:errors] = 'Invalid comment!'
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @commentdel = Comment.includes(:post).find(params[:id])
    @post = @commentdel.post

    if @commentdel.destroy
      flash[:notice] = 'Comment deleted!'
    else
      flash.now[:errors] = 'Unable to delete comment!'
    end
    redirect_to user_post_path(@post.author, @post), notice: 'Comment was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
