class AddProposalIdToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :proposal_id, :integer
  end
end
