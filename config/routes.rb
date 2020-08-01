Rails.application.routes.draw do
  
  
  devise_for :users
 
  
  post "post/view" => "posts#save_post_view", as: :post_view
  root "public#homepage"

  resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
