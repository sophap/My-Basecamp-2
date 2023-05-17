class AddProjectIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :project, null: false, foreign_key: true
  end
end
