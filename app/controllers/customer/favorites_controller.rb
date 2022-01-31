class Customer::FavoritesController < ApplicationController
    
  def create
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.new(item_id: item.id)
    favorite.save
    redirect_to item_show_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_customer.favorites.find_by(item_id: item.id)
    favorite.destroy
    redirect_to item_show_path(item)
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:item_id, :customer_id)
  end
  
end
