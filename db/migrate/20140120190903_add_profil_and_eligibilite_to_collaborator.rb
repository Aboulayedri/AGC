class AddProfilAndEligibiliteToCollaborator < ActiveRecord::Migration
  def change
    add_column :collaborators, :profil, :string
    add_column :collaborators, :eligibilite, :string
  end
end
