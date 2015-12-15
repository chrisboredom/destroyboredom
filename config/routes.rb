Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root to: 'posts#index'

  # Avoids routing errors for missing Devise sign_up route
  get '*path' => redirect('/')
end
