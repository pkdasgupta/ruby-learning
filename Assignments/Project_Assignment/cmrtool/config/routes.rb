Rails.application.routes.draw do
  resources :changes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root pointing to CMR Listing
  root 'changes#index'
  
end
