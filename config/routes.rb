Rails.application.routes.draw do
 
  devise_for :instructores
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do 
        delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
    
  end
  
  scope module: 'instructores' do
    resources :posts
  end

  get 'home/index'
  root to:"home#index"

end
