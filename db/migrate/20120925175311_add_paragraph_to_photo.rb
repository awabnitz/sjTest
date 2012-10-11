class AddParagraphToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :paragraph, :text
  end
end
