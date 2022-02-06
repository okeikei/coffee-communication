class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.float :rate, null: false, default: 0
      t.text :comment, null: false

      t.timestamps
    end
  end
end
