class Customer::FavoritesController < ApplicationController
    
  def create
    item = Item.find(params[:item_id])
    favorite = item.favorites.new(item_id: item.id)
    favorite.customer_id = current_customer.id
    favorite.save
    redirect_to customer_item_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.find_by(item_id: item.id)
    favorite.destroy
    redirect_to customer_item_path(item)
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:item_id, :customer_id)
  end
  
end
