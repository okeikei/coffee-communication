class Customer::RelationshipsController < ApplicationController
 # before_action :set_customer
 

  def create
      #binding.pry 
    @customer = Customer.find(params['follow_id'])
    following = current_customer.follow(@customer)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to customer_index_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to customer_index_path
    end
  end

  def destroy
    @customer = Customer.find(params['follow_id'])
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to customer_index_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to customer_index_path
    end
  end
  
  private
  def relationship_params
    params.require(:relationship).permit(:follow_id, :customer_id)
  end

  private
  def set_customer
    @customer = Customer.find(params[:follow_id])
  end

end

