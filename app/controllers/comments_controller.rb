class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: comment_params[:text], post_id: params[:post_id], author_id: current_user[:id])

    if @comment.save
      redirect_to user_posts_path(user_id: params[:user_id]), notice: 'Comment added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
