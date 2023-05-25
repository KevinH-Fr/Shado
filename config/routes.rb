Rails.application.routes.draw do
  resources :campaigns

  resources :friends
  get 'notifications/index'
  get 'dashboard/index'
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

  resources :comments, only: [] do
    resources :comments, only: %i[new create destroy], module: :comments
  end

  resources :posts do
    resources :comments, only: %i[new create destroy], module: :posts

    member do 
      patch :upvote
      patch :downvote
      patch :vote
    end
  end

  root "home#index"
end
