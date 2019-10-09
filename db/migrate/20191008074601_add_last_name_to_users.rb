class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_namer, :string
    add_column :users, :sex, :integer
    add_column :users, :old, :integer
  end
end
