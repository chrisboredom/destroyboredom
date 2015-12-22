Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]
  root to: 'posts#index'

  # Avoids routing errors for missing Devise sign_up route
  get '*path' => redirect('/')
end
