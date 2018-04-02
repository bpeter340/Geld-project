Rails.application.routes.draw do

  get 'about/index'

  get 'user_page/index'

  get 'home/index'

  resource :home do
    member do
      get :access_token
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
