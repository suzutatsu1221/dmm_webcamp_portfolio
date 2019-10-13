class RemoveFirstNamerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_namer, :string
  end
end
