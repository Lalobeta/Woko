Rails.application.routes.draw do
  root to: 'home#index'

  # MOUNTS
  mount Commontator::Engine => '/commontator'

  # DEVISE
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
      post 'to_author', aciton: 'to_author'
    end
  end
  
  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  # RESOURCES
  resources :wikis do
    member do
      put 'like' => 'wikis#like'
    end
  end
  
  # post 'wikis' => "wikis#create"
  # put 'wikis/:id' => "wikis#update"
  delete "posts/:id" => "posts#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end