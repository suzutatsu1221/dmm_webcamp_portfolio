class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :hobby_1, :integer
    add_column :users, :hobby_2, :integer
    add_column :users, :hobby_3, :integer
  end
end
