class Customer::HomesController < ApplicationController
    
  def top
    @items = Item.page(params[:page]).reverse_order
    #@articles = Article.all.search(params[:search])
  end
  
  def about
  end
end
