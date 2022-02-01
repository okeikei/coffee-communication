class Customer::SellItemsController < ApplicationController
    
   def show
    @sell_items = current_customer.items
    if params[:is_active] == true
      @items.is_active = "販売中"
    
    elsif params[:is_active] == false
      @items.is_active = "販売停止中"
    end
   end
  
  def edit
    @sell_item = Item.find(params[:id])
  end
  
  private
  def sell_item_params
    params.require(:sell_item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end
  
end
