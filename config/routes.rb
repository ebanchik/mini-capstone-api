Rails.application.routes.draw do
  get "/products" => "products#index" 
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/product/:id" => "products#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"
  get "/orders" => "orders#index"

  post "/add_to_cart" => "carted_products#create"
  get "/cart" => "carted_products#index"
end
