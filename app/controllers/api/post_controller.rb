class Api::PostController < ActionController::API
  def index
    render json: Post.all
  end
end
