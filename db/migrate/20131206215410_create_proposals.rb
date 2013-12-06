class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :consultant_id
      t.date :date
      t.integer :nbre_jour
      t.string :etat

      t.timestamps
    end
  end
end
