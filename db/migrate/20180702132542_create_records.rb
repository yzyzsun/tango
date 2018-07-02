class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :word, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
