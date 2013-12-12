class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :entity_id
      t.date :date

      t.timestamps
    end
  end
end
