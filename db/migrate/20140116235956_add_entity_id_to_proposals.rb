class AddEntityIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :entity_id, :integer
  end
end
