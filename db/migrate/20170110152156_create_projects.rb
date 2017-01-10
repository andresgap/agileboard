class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :owner
      t.string :state
      t.integer :number_sprints
      t.text :details
      t.string :sprints

      t.timestamps
    end
  end
end
