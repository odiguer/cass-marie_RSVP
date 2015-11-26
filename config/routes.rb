Rails.application.routes.draw do
  get 'summaries/index'

  root 'static_pages#home'
  get 'wedding_party' => 'static_pages#wedding_party'
  get 'event' => 'static_pages#event'
  get 'travel' => 'static_pages#travel'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources:foodstuffs, :except => [:show, :destroy]
  resources:guests, :except => :show

  resources:rsvps, :only => [:edit, :update] do
    collection do
      get 'find'
      post 'locate'
    end
  end

  resources:summaries, :only => [:index]
  resources:users, :only => [:edit, :update]
end
