class AddColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	add_column :favorites, :video_id, :string
  end
end
