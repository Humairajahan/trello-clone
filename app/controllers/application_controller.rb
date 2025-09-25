class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private
  def not_found(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :not_found
  end

  def not_destroyed(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_content
  end
end
