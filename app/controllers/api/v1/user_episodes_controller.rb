class Api::V1::UserEpisodesController < ApplicationController
  def show
    render json: Episode.where(user_id: params[:id]).to_json(include: %i[episode_comments])
  end
end
