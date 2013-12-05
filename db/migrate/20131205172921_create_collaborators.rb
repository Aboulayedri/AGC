class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :prenom
      t.string :nom
      t.string :id_karma
      t.string :role
      t.string :email
      t.string :etat
      t.string :statut
      t.string :niv_diplome
      t.string :nat_diplome
      t.integer :entity_id
      t.integer :manager_id
      t.text :commentaire

      t.timestamps
    end
  end
end
