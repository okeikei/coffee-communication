class Customer::HomesController < ApplicationController
    
  def top
    @items = Item.all
    #@articles = Article.all.search(params[:search])
  end
  
  def about
  end
end
