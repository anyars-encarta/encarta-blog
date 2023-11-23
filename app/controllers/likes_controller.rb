# rubocop:disable Layout/EndOfLine
class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      flash[:success] = 'Like created successfully!'
      redirect_to post_path(@like.post)
    else
      flash.now[:error] = 'Failed to create like'
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
# rubocop:enable Layout/EndOfLine
