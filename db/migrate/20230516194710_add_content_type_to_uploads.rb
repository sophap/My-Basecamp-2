class AddContentTypeToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :content_type, :string
  end
end
