class Api::CommentController < ActionController::API
  def index
    @comments = Post.includes(:comments).find_by(author_id: params[:user_id], id: params[:post_id]).comments
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new(text: comment_params[:text], post_id: params[:post_id], author_id: params[:user_id])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
