class Customer::ItemCommentsController < ApplicationController
  before_action :authenticate_customer!
    
  def index
    @item_comments = ItemComment.where(item_id: params[:id])
  end
  
  def show
    @item_comment = ItemComment.find(params[:id])
  end
  
  def new
    @item_comment = ItemComment.new
    @item = Item.find(params[:id])
  end
  
  def create
    item_comment = ItemComment.new(item_comment_params)
    item_comment.item_id = params[:id]
    item_comment.customer_id = current_customer.id
    item_comment.rate = params[:item_comment][:rate]
    item_comment.save
    redirect_to item_comment_index_path
  end
  
  def destroy
    item_comment = ItemComment.find(params[:id])
    item_id = item_comment.item_id
    item_comment.destroy
    redirect_to item_comment_index_path(item_id)
  end
  
  private
  def item_comment_params
    params.permit(:customer_id, :item_id, :comment, :rate)
  end
  
end
