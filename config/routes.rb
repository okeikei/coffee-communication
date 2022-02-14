Rails.application.routes.draw do
# 顧客用
# /customers/sign_in ...
# 顧客用
# /customers/sign_in ...
devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :customer do
  resources :relationships, only: [:index, :show, :create, :destroy]
  resources :items
  resources :sell_items
 end
 
 get "/relationships/follower" => "customer/relationships#follower", as: 'followers'
  
  root to: 'customer/homes#top'
  get "/home/about" => "customer/homes#about"
   
  get "/item/search" => "customer/items#search"
  get "/item/:id/favorite" => "customer/items#favorite", as: 'item_favorites'

  # get "/item/new" => "customer/items#new"
  # get "/item/index" => "customer/items#index"
  # get "/item/:id" => "customer/items#show", as: 'item_show'
  # get "/item/edit" => "customer/items#edit"
  # post "/items" => "customer/items#create", as: 'item_create'
  # patch "/items" => "customer/items#update"
  

  
  get "/item_comments/:id/show" => "customer/item_comments#show", as: 'item_comment_show'
  get "/item_comments/:id/index" => "customer/item_comments#index", as: 'item_comment_index'
  post "/item_comments/:id/create" => "customer/item_comments#create", as: 'item_comment_create'
  delete "/item_comments/:id/destroy" => "customer/item_comments#destroy", as: 'item_comment_destroy'
  
  get "/customer/show" => "customer/customers#show"
  get "/customer/index" => "customer/customers#index"
  get "/customer/:id" => "customer/customers#register", as: 'customer_register'
  get "/customer/:id/edit" => "customer/customers#edit", as: 'customer_edit'
  patch "/customer/:id/update" => "customer/customers#update", as: 'customer_update'
  get "/customer/unsubscribe" => "customer/customers#unsubscribe"
  patch "/customer/withdraw" => "customer/customers#withdraw"
  get "/customer/:id/follow" => "customer/customers#follow", as: 'customer_followes'
  get "/customer/:id/follower" => "customer/customers#follower", as: 'customer_followers'
  get "/customer/:id/favorite" => "customer/customers#favorite", as: 'customer_favorites'
  
  get "/addresses" => "customer/addresses#index", as: 'adderess_index'
  get "/address/:id/edit" => "customer/addresses#edit", as: 'adderess_edit'
  post "/addresses" => "customer/addresses#create", as: 'adderess_create'
  patch "/address/:id" => "customer/addresses#update", as: 'adderess_update'
  delete "/address/:id" => "customer/addresses#destroy", as: 'adderess_destroy'
  
  get "/cart_items" => "customer/cart_items#index"
  post "/cart_items/:id" => "customer/cart_items#create", as: 'cart_items_create'
  patch "/cart_item/:id" => "customer/cart_items#update"
  delete "/cart_item/:id" => "customer/cart_items#destroy", as: 'cart_items_destroy'
  delete "/cart_items/destroy_all" => "customer/cart_items#destroy_all",as: 'cart_items_all_destroy'
  
  get "/orders/new" => "customer/orders#new"
  post "/orders/comfirm" => "customer/orders#comfirm"
  get "/orders/complete" => "customer/orders#complete"
  post "/orders" => "customer/orders#create"
  get "/orders" => "customer/orders#index", as: 'order_index'
  get "/order/:id" => "customer/orders#show", as: 'order_show'
  
  get "/favorites/:id" => "customer/favorites#show", as: 'favorite_show'
  post "/favorites/:id/create" => "customer/favorites#create", as: 'favorite_create'
  delete "/favorites/:id/destroy" => "customer/favorites#destroy", as: 'favorite_destroy'
  
  
#namespaceをつけるとURLに名前を付けることができる
  namespace :admin do
  root to: 'homes#top'
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  end
end