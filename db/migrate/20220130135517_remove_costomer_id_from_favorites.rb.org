class RemoveCostomerIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :costomer_id, :integer
  end
end
