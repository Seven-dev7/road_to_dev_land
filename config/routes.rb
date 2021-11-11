Rails.application.routes.draw do
  devise_for :users
  resources :user_profiles, only: %i(show edit update)
  root to: "static_pages#index"

  get '/codewars_search' => 'static_pages#codewars_search'
  get '/search_content' => 'static_pages#search_content'
end
