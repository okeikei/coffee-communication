class Customer::ItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @item = Item.new
    @genre = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to item_index_path
  end
  
  def index
    @items = Item.all
    if params[:is_active] == true
      @items.is_active = "販売中"
    elsif params[:is_active] == false
      @items.is_active = "販売停止中"
    end
  end
  
  def show
    @item = Item.find(params[:id])
    if params[:is_active] == true
      @items.is_active = "販売中"
    
    elsif params[:is_active] == false
      @items.is_active = "販売停止中"
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_index_path
  end
  
  private
  def item_params
    params.require(:item).permit(:customer_id, :name, :image, :introduction, :genre_id, :price, :is_active)
  end

end
