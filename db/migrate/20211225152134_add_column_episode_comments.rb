class AddColumnEpisodeComments < ActiveRecord::Migration[6.1]
  def change
    add_column :episode_comments, :contributor_name, :string, after: :content
    add_column :episode_comments,
               :contributor_image,
               :string,
               after: :contributor_name
  end
end
