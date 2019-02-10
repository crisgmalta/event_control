class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing do
    render json: { message: 'invalid payload' }, status: :unprocessable_entity
  end
end
