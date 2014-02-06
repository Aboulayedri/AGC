class AddProjectCodeToAramisEntities < ActiveRecord::Migration
  def change
    add_column :aramis_entities, :project_code_id, :integer
  end
end
