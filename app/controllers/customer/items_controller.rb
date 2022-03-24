class Customer::ItemsController < ApplicationController

  before_action :authenticate_customer!

  # TODO: To sell_items_controller
  # def new
  #   @item = Item.new
  #   @genre = Genre.all
  # end

  # def create
  #   @item = Item.new(item_params)
  #   @item.customer_id = current_customer.id
  #   @item.save!
  #   redirect_to customer_items_path
  # end

  def index
    @items = Item.page(params[:page]).reverse_order

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


  def search
    if params[:genre].present?
      @keyword = Genre.find(params[:genre])
      @items = Item.where(genre_id: params[:genre])
      # if params[:search_category] === "customer_name"
      #   ## use検索処理
      #   customer_name = Customer.where('name LIKE ?', "%#{@keyword}%").pluck(:name)
      #   @items = Item.where(customer_name: customer_name)
      # else
      #   params[:search_category] === "genre"
      #   genre_id = Genre.where('name LIKE ?', "%#{@keyword}%").pluck(:id)
      #   @items = Item.where(genre_id: genre_id)
      # end
    else
      @items = Item.all
    end
  end

  def destroy
  cart_items = CartItem.find(params[:id])
  cart_items.destroy
  flash[:notice]="Book was successfully destroyed."
  redirect_to cart_items_path
  end

  # def edit
  #   # @item = Item.where(customer_id: params[:id])
  # end

  # def update
  #   # @item = Item.find(params[:id])
  #   # @item.update(item_params)
  #   # redirect_to customer_items_path
  # end

  private
  def item_params
    params.require(:item).permit(:customer_id, :name, :image, :introduction, :genre_id, :price, :is_active, :shop_name)
  end

end
