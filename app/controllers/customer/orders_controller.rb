class Customer::OrdersController < ApplicationController
 before_action :authenticate_customer!
 
 def new
  @customer = current_customer
  @order = Order.new
 end
    
 def index
  @orders = current_customer.orders
 end
    
 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end
    
 def create
  @order = Order.new
  @order = current_customer.orders.build(order_params)
  @order.save
  cart_items = CartItem.where(customer_id: current_customer.id)#ログインユーザーをcart_itemsに変換
  cart_items.each do |cart_item, order_detail|
    order_detail = OrderDetail.new
    order_detail.order_id = @order.id
    order_detail.item_id = cart_item.item_id
    order_detail.price = cart_item.item.price
    order_detail.amount = cart_item.amount
    order_detail.making_status = 0
    order_detail.save
    @item = Item.find(cart_item.item_id)
    @item.is_active = "販売停止中"
    @item.save
    #@item.update(is_active: false)
  end
  current_customer.cart_items.destroy_all
  redirect_to orders_complete_path
 end
 
 def comfirm
  @cart_items = current_customer.cart_items
  @order = Order.new
  @order.order_details.build
  @order = Order.new(order_params)
  @order.payment_method = params[:order][:payment_method]
   if params[:order][:address_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
    
   elsif params[:order][:address_option] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    
   elsif params[:order][:address_option] == "2"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
   end
   
 end
 
 def pay
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    :amount => params[:amount],
    :card => params['payjp-token'],
    :currency => 'jpy'
  )
 end
 
 def complete
 end
    
  private
   def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :item_id, order_details_attributes: [:id, :order_id, :item_id, :price, :amount])
   end
end