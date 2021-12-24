class AddColumnsToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :contributor_name, :string, after: :content
    add_column :episodes, :contributor_image, :string, after: :contributor_name

    add_reference :episodes, :user, foreign_key: true, after: :content
  end
end
