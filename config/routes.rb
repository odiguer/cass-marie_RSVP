Rails.application.routes.draw do
  root 'static_pages#home'
  get 'wedding_party' => 'static_pages#wedding_party'
  get 'event' => 'static_pages#event'
  get 'travel' => 'static_pages#travel'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'foodstuff/list'
  get 'foodstuff/load'
  get 'foodstuff/create'

  get 'guest/create'
  get 'guest/list'
  get 'guest/load'
  get 'users/new'
  get 'users/update'

  resources:foodstuffs, :except => [:show, :destroy]
  resources:guests, :except => :show
end
