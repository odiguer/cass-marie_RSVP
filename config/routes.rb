Rails.application.routes.draw do
  root 'static_pages#home'
  get 'wedding_party' => 'static_pages#wedding_party'
  get 'event' => 'static_pages#event'
  get 'travel' => 'static_pages#travel'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  #RSVP
  # get 'rsvp' => 'rsvp#find'
  # post 'rsvp_locate' => 'rsvp#locate'
  # get 'rsvp_edit' => 'rsvp#edit'

  resources:foodstuffs, :except => [:show, :destroy]
  resources:guests, :except => :show

  resources:rsvps, :only => [:edit, :update] do
    collection do
      get 'find'
      post 'locate'
    end
  end
end
