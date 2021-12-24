class Api::V1::UsersController < ApplicationController
  def show
    render json: Episode.where(user_id: params[:id])
  end
end
