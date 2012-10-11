class AddSubheadToPost < ActiveRecord::Migration
  def change
    add_column :posts, :subhead, :string
  end
end
