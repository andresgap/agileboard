class AddReferencesToSprints < ActiveRecord::Migration[5.0]
  def change
    add_reference :sprints, :user, foreign_key: true
    add_reference :sprints, :project, foreign_key: true
  end
end
