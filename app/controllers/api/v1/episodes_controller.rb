class Api::V1::EpisodesController < ApplicationController
  def index
    render json: Episode.all
  end

  def show
    render json: Episode.find(params[:id])
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
    if episode.update(episode_params)
      render json: episode
    else
      render json: episode.errors, status: 422
    end
  end

  def destroy
    episode = Episode.find(params[:id])
    episode.destroy
    render json: episode
  end

  private

  def episode_params
    params.permit(:content)
  end
end
