Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #To avoid having to having to navigate to /post
  root 'posts#index'
 
  # Setting up route 
   resources :posts do
  	resources :comments
  end
end
 