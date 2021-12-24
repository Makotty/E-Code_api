class Episode < ApplicationRecord
  belongs_to :user
  has_many :episode_comments, dependent: :destroy
end
