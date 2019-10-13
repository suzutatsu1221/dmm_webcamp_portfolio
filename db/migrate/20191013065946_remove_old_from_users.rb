class RemoveOldFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :old, :integer
  end
end
