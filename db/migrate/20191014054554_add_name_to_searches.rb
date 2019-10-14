class AddNameToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :search_name, :string
    add_column :searches, :search_count, :integer, default: 0
  end
end
