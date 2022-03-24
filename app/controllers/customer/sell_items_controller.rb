class Customer::SellItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = current_customer.items
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to customer_sell_items_path
  end

  def edit
    @customer = current_customer
    @sell_item = Item.find(params[:id])
    # if params[:is_active] == true
    #   @items.is_active = "販売中"
    # elsif params[:is_active] == false
    #   @items.is_active = "販売停止中"
    # end
  end

  def update
    @sell_item = Item.find(params[:id])
    @sell_item.update(item_params)
    redirect_to customer_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active, :customer_id, :shop_name)
  end

end
