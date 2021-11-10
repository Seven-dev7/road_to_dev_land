Rails.application.routes.draw do
  devise_for :users
  resources :user_profiles
  root to: "static_pages#index"
  get '/search' => 'static_pages#search', :as => 'search'
end
