class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :post_id
      t.string :positionable_type
      t.integer :positionable_id
      t.integer :order

      t.timestamps
    end
  end
end
