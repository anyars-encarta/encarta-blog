# rubocop:disable Layout/EndOfLine
class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to post_path(@comment.post)
    else
      flash.now[:error] = 'Failed to create comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
# rubocop:enable Layout/EndOfLine
