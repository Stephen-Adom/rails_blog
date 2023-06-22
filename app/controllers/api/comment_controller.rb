class Api::CommentController < ActionController::API
    def index
        @comments = Post.includes(:comments).find_by(author_id: params[:user_id], id: params[:post_id]).comments
      render json: @comments, status: :ok
    end
  end