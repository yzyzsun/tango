class AddEditableToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :editable, :boolean, default: false
  end
end
