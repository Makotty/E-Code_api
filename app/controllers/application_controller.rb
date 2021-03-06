class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Helpers

  skip_before_action :verfy_authenticity_token, raise: false
  helper_method :current_user, :user_signed_in?, :authenticate_user!
end
