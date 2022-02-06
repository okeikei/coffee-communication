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
  resources :relationships, only: [:create, :destroy]
  resources :items
  resources :sell_items
 end
  
  root to: 'customer/homes#top'
  get "/home/about" => "customer/homes#about"
  
  

  # get "/item/new" => "customer/items#new"
  # get "/item/index" => "customer/items#index"
  # get "/item/:id" => "customer/items#show", as: 'item_show'
  # get "/item/edit" => "customer/items#edit"
  # post "/items" => "customer/items#create", as: 'item_create'
  # patch "/items" => "customer/items#update"
  

  
  get "/item_comments/show/:id" => "customer/item_comments#show", as: 'item_comment_show'
  get "/item_comments/index/:id" => "customer/item_comments#index", as: 'item_comment_index'
  post "/item_comments/create/:id" => "customer/item_comments#create", as: 'item_comment_create'
  
  get "/customer/show" => "customer/customers#show"
  get "/customer/index" => "customer/customers#index"
  get "/customer/:id" => "customer/customers#register", as: 'customer_register'
  get "/customer/edit" => "customer/customers#edit"
  patch "/customer" => "customer/customers#update"
  get "/customer/unsubscribe" => "customer/customers#unsubscribe"
  patch "/customer/withdraw" => "customer/customers#withdraw"
  
  get "/addresses" => "customer/addresses#index"
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
  
  post "/favorites/:item_id" => "customer/favorites#create", as: 'favorite_create'
  delete "/favorites" => "customer/favorites#destroy", as: 'favorite_destroy'
  
  
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