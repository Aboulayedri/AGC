class AddAramisEntityIdToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :aramis_entity_id, :integer
  end
end
