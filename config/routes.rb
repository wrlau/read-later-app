Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :reading_lists
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
