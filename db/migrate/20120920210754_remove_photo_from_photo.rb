class RemovePhotoFromPhoto < ActiveRecord::Migration
  def up
    remove_column :photos, :photo
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
  end

  def down
    add_column :photos, :photo_updated_at, :datetime
    add_column :photos, :photo_file_size, :integer
    add_column :photos, :photo_content_type, :string
    add_column :photos, :photo_file_name, :string
    add_column :photos, :photo, :string
  end
end
