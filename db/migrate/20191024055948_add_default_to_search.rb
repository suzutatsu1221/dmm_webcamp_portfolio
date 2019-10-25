class AddDefaultToSearch < ActiveRecord::Migration[5.2]
  def up
  	change_column :searches, :search_name, :string, null: false
  end
  def down
  	change_column :searches, :search_name, :string
  end
end
