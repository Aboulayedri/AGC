class AddProjetcIdToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :project_id, :integer
  end
end
