Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :path => 'accounts', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show] do
    resources :reading_lists
  end
  post 'users/:user_id/reading_lists/new' => 'reading_lists#new'
  post 'users/:user_id/reading_lists/:id/edit' => 'reading_lists#edit'
  delete 'users/:user_id/reading_lists/:id' => 'reading_lists#destroy'
  patch 'articles/:id' => 'articles#update'
  resources :articles, only: [:show, :edit, :update]
  resources :categories, only: [:index, :show] do
    resources :subcategories, only: [:show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
