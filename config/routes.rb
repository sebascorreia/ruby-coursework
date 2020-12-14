Rails.application.routes.draw do
  resources :bands do #nesting resources to define better routes
    resources :albums, only: [:index, :new,:edit, :update, :create] do
      resources :songs, only: [:index, :new, :create, :edit, :update] #only use the necessary resources
    end
  end
  resources :albums, only:[:show,  :destroy]
  resources :songs, only:[:show, :destroy]

  get 'home/home'
  get 'albums/band_albums'
  get '/contact'=> 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
end
