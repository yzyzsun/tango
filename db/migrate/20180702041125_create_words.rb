class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :text
      t.string :pronunciation
      t.string :translation
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
