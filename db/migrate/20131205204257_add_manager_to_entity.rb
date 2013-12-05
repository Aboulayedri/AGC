class AddManagerToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :manager_id, :integer
  end
end
