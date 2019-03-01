class API::V1::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(e)
    render json: {error: e.to_s}, status: :bad_request
  end
end
