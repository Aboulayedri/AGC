class CreateProjectCodes < ActiveRecord::Migration
  def change
    create_table :project_codes do |t|
      t.string :name

      t.timestamps
    end
  end
end
