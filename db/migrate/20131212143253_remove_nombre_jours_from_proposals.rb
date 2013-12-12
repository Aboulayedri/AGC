class RemoveNombreJoursFromProposals < ActiveRecord::Migration
  def change
    remove_column :proposals, :nombre_jours, :string
  end
end
