Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'maps#index'
resources :maps, only: [:index, :show]

end
