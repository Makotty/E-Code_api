class AddColumnsToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_reference :episodes, :user, foreign_key: true, after: :content
  end
end
