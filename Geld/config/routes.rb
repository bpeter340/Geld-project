Rails.application.routes.draw do

  get 'brian', to: 'brians#index'

  get 'about', to: 'about#index'

  get 'app', to: 'user_page#index'

  get 'new_contact', to: 'contacts#new' 

  get 'home/index'

  resources :contacts, only: [:new,:create]
  resource :user_page do
    member do
      post :access_token, to: 'user_page#access_token'
      get :accounts, to: 'user_page#accounts'
      get :transactions, to: 'user_page#transactions'
      get :item, to: 'user_page#item'
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
