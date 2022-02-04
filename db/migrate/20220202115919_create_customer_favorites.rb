class CreateCustomerFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_favorites do |t|
      
      t.integer :custoer_id#いいねを送られた人
      t.integer :sender_id#いいねを送った人

      t.timestamps
    end
  end
end
