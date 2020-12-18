class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :date, null:false
      t.integer :time, null: false
      t.string :skip, null: false
      t.string :to_do
      t.timestamps
    end
  end
end
