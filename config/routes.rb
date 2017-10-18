Rails.application.routes.draw do

  # root 'a#b'

  # autocreated routes
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/delete'

  # Use resourcful routs, and manually add :delete
  resources :users do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
