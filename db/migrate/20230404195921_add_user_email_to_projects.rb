class AddUserEmailToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :user_email, :string
  end
end
