class CreateContentzones < ActiveRecord::Migration
  def change
    create_table :contentzones do |t|
      t.integer :post_id
      t.text :paragraph
      t.integer :order_id
      t.timestamps
    end
  end
end
