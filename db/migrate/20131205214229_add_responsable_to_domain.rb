class AddResponsableToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :responsable_id, :integer
  end
end
