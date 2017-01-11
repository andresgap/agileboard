class CreateSprints < ActiveRecord::Migration[5.0]
  def change
    create_table :sprints do |t|
      t.timestamp :begin_sprint
      t.timestamp :end_sprint
      t.integer :hours
      t.integer :number_tasks
      t.integer :num_compromised_points
      t.string :state
      t.integer :completed_tasks
      t.integer :completed_points
      t.integer :defects_found
      t.string :owner_sprint

      t.timestamps
    end
  end
end
