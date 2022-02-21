class Customer::CustomerReviewsController < ApplicationController
    
  before_action :authenticate_customer!
    
  def index
    @customer_reviews = CustomerReview.where(customer_id: params[:id])
    @customer_reviews = CustomerReview.all
  end
  
  def show
    @customer_reviews = CustomerReview.find(params[:id])
  end
  
  def new
    @customer_review = CustomerReview.new
    @customer = Customer.find(params[:id])
  end
  
  def create
    customer_review = CustomerReview.new(customer_review_params)
    #customer_review.customer_id = params[:id]
    customer_review.customer_id = current_customer.id
    customer_review.rate = params[:item_comment][:rate]
    customer_review.save
    redirect_to customer_review_index_path
  end
  
  def destroy
    customer_review = CustomerReview.find(params[:id])
    customer_review.destroy
    redirect_to customer_review_index_path
  end
  
  private
  def customer_review_params
    params.permit(:customer_id, :comment, :rate)
  end
  
end
