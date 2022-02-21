class CreateCustomerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_reviews do |t|
      
      t.integer :customer_id, null: false
      t.float :rate, null: false, default: 0
      t.text :comment, null: false

      t.timestamps
    end
  end
end
