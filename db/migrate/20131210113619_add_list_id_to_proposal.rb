class AddListIdToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :list_id, :integer
  end
end
