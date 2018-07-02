class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end

    create_table :books_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
    end
  end
end
