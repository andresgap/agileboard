class AddUserIdToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :user_id, :string
  end
end
