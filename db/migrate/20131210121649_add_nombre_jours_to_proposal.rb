class AddNombreJoursToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :nombre_jours, :integer
  end
end
