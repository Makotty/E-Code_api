class Api::V1::EpisodesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]
  def index
    render json: Episode.all.to_json(include: %i[episode_comments])
  end

  def show
    episode = Episode.find(params[:id]).to_json(include: %i[episode_comments])
    render json: episode
  end

  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode
    else
      render json: episode.errors, status: 422
    end
  end

  def update
    episode = Episode.find(params[:id])

    if current_api_v1_user.id == episode.user_id
      if episode.update(episode_params)
        render json: episode
      else
        render json: episode.errors, status: 422
      end
    else
      render json: { message: '更新できませんでした' }, status: 422
    end
  end

  def destroy
    episode = Episode.find(params[:id])
    if current_api_v1_user.id == episode.user_id
      episode.destroy
      render json: episode
    else
      render json: { message: '削除できませんでした' }
    end
  end

  private

  def episode_params
    params
      .permit(:content, :contributor_name, :contributor_image)
      .merge(user_id: current_api_v1_user.id)
  end
end
