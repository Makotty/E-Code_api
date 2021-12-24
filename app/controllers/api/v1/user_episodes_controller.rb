class Api::V1::UserEpisodesController < ApplicationController
  def show
    render json: Episode.where(user_id: params[:id])
  end
end
