class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end
    
  def index
    @customers = Customer.all
    @customers = Customer.all.order(rank_point: :desc)
    @sell_items = current_customer.items
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def register
    @customer = Customer.find(params[:id])
    @sell_items = @customer.items
  end
  
  def follow
    @customer = Customer.find(params[:id])
    @customers = @customer.followings
  end
  
  def follower
    @customer = Customer.find(params[:id])
    @customers = @customer.followers
  end
  
  def favorite
    @item = Item.find(params[:id])
    #@customers = @item.favorites
    @favorites = @item.favorites
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_show_path
  end
  
  def withdraw
    current_customer.destroy
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :image)
  end
  
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  
end