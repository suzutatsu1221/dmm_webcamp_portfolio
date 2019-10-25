class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.integer :favorite_id

      t.timestamps
    end
  end
end
