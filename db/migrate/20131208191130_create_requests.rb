class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :project_id
      t.integer :consultant_id
      t.date :date
      t.string :etat

      t.timestamps
    end
  end
end
