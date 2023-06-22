class Api::PostApiController < ActionController::API
  def index
    render json: Post.all
  end
end
