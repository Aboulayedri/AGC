class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :domain_id
      t.integer :chef_id
      t.integer :maitrise_ouvrage_id
      t.text :description

      t.timestamps
    end
  end
end
