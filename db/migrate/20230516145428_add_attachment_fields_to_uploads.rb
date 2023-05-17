class AddAttachmentFieldsToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :uploads, :string
  end
end
