class AddNameToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :name, :string
  end
end
