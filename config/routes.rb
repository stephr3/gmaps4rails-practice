Rails.application.routes.draw do
  resources :schools, only: [:index, :new, :create, :show]

  root to: 'schools#index' 
end
