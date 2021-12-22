class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :birth_day,
      :file_url
    )
  end
end
