Rails.application.routes.draw do
  resources :bands do
    resources :albums do
      resources :songs
    end
  end

  get 'home/home'
  get 'albums/band_albums'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
end
