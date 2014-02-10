class AddEtatToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :etat, :string
  end
end
