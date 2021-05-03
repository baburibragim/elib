Rails.application.routes.draw do
  root 'books#index'

  get 'all' => 'books#all', as: 'all_books'
  get 'search' => 'books#search', as: 'search'
  resources :books
end
