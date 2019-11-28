Rails.application.routes.draw do
  resources :books
  get 'top' ,to: 'books#top'

  root :to => 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
