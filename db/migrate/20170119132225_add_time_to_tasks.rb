class AddTimeToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :to_do_start_time, :timestamp
    add_column :tasks, :to_do_end_time, :timestamp
    add_column :tasks, :done_time, :timestamp
  end
end
