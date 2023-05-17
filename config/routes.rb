Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  get 'projects' => 'projects#index'
  
    resources :projects do 
      resources :discussions do
        resources :comments, only: [:new, :create, :edit, :update, :destroy]
      end
      resources :uploads, only: [:create, :index, :show, :destroy]
    end
  

  #get 'home/project'
  #root 'home#project'
  root 'projects#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
