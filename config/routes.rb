Rails.application.routes.draw do

  resources :categories
  resources :sub_categories
  resources :roles
  resources :states
  resources :priorities
  resources :directions
 
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users
  resources :users


  get 'assistance/index'
  get 'assistance/close'
  match 'assistance/show/:id', to: 'assistance#show', as: 'assistance', via:[:get, :post]
# post 'assistance/show/:id', to: 'assistance#show', as: 'assistance_post'
  post 'assistance/:id/close', to: 'assistance#pre_close', as: 'pre_close_support_assistance'


  #root 'test#index'
  resources :supports do
    member do
      get  'close'
      post 'close'
      post 'show'
      get  'show'
    end
  end

   #get 'supports/:category/subcategories' => 'supports#subcategories', as: 'subcategories'
  
end


