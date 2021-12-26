class Api::V1::EpisodeCommentsController < ApplicationController
  def index
    render json: EpisodeComment.all
  end

  def create
    episode_comment = EpisodeComment.new(episode_comment_params)
    if episode_comment.save
      render json: episode_comment
    else
      render json: episode_comment.errors, status: 422
    end
  end

  def destroy
    episode_comment = EpisodeComment.find(params[:id])
    if current_api_v1_user.id == episode_comment.user_id
      episode_comment.destroy
      render json: episode_comment
    else
      render json: { message: '削除できませんでした' }
    end
  end

  private

  def episode_comment_params
    params
      .permit(:content, :episode_id, :contributor_name, :contributor_image)
      .merge(user_id: current_api_v1_user.id)
  end
end
