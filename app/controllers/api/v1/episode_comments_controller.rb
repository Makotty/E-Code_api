class Api::V1::EpisodeCommentsController < ApplicationController
  def create
    episode_comment = EpisodeComment.new(episode_comment_params)
    if episode_comment.save
      render json: episode_comment
    else
      render json: episode_comment.errors, status: 422
    end
  end

  private

  def episode_comment_params
    params.permit(:content, :episode_id).merge(user_id: current_api_v1_user.id)
  end
end
