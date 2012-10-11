class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :author_id
      t.string :video_url
      t.integer :facebook, :null => false, :default => 0
      t.integer :twitter, :null => false, :default => 0
      t.string :subhead
      t.has_attached_file :avatar
      t.timestamps
    end
  end
end
