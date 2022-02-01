class CreateSellItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_items do |t|
      
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      t.integer :item_id
      t.integer :genre_id
      t.integer :status
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
