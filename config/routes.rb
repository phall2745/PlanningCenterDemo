Rails.application.routes.draw do
  get 'welcome/index'
  get 'songs/index'
  root 'welcome#index'
  resources :songs do
    resources :arrangements
  end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
