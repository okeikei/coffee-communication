class Customer::CustomerFavoritesController < ApplicationController
    
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = current_customer
  end
    
  def create
    following = current_customer.follow(@customer)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @customer
    end
  end

  def destroy
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @customer
    end
  end

  private
  def customer_favorite_params
    params.require(:customer_favorite).permit(:sender_id, :customer_id)
  end
end
