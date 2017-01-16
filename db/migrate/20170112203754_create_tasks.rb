class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type_task
      t.integer :user_id
      t.integer :sprint_id
      t.timestamp :dev_start_time
      t.timestamp :dev_end_time
      t.timestamp :qa_start_time
      t.timestamp :qa_end_time
      t.string :state_task
      t.references :project, foreign_key: true
      t.references :sprint, foreign_key: true

      t.timestamps
    end
  end
end
