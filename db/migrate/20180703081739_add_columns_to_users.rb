class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sid, :string
    add_column :users, :name, :string
    add_column :users, :major, :string
  end
end
