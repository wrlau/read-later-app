Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :reading_lists
  post 'reading_lists/new' => 'reading_lists#new'
  delete 'reading_lists/:id' => 'reading_lists#destroy'
  patch 'articles/:id' => 'articles#update'
  resources :articles
  resources :categories, only: [:index, :show] do
    resources :subcategories, only: [:show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
