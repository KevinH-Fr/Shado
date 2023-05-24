Rails.application.routes.draw do
  resources :associations

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show'
  get 'users/:id' => 'users#show', as: 'user'

  
  get 'home/index'

  resources :fans do
    member do
      post :edit
    end
  end

  resources :athletes do
    member do
      post :edit
    end
  end

  resources :posts

  root "home#index"
end
