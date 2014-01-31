class CreateAramisEntities < ActiveRecord::Migration
  def change
    create_table :aramis_entities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
