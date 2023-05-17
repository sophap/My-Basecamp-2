class ChangeUploadsColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :uploads, :uploads, :string, default: "{}", array: true
  end
end
