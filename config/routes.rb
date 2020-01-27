Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    resources :artists do
      resources :albums
      resources :genres
    end
    resources :albums do
      resources :songs
    end
  end
end
