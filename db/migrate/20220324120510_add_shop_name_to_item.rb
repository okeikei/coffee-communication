class AddShopNameToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shop_name, :string
  end
end
