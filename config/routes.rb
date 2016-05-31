Rails.application.routes.draw do

  devise_for :users , :controllers => {
   :sessions      => "users/sessions",
   :registrations => "users/registrations",
   :passwords     => "users/passwords",
   :invitations   => "users/invitations"
  }, :path => "auth",
                    :path_names => {:sign_in => 'login', :sign_out => 'logout',
                    :password => 'secret', :confirmation => 'verification',
                    :unlock => 'unlock', :registration => 'register',
                    :sign_up => 'cmon_let_me_in' }

#  get    'signup_buyer' , to: 'users#new_buyer'
#  get    'signup_seller' , to: 'users#new_seller'
  
  resources :users , except: [:new, :create, :index, :edit, :update, :destroy] do
    member do
      get :s_show
      get :b_show
      get :s_dashboard
      get :b_dashboard
    end
  end
  resources :industries
  resources :seller_conditions
  resources :buyer_conditions
  resources :sellers do
    member do
      get :new_summary
      get :show_summary
      get :new_detail
      get :show_detail
      get :followers
      get :following
      patch :confirm_summary
      patch :confirm_detail
    end
  end
  resources :buyers do
    member do
      get :new_detail
      get :show_detail
      get :followers
      get :following
    end
  end
#  resources :sessions, only: [:new, :create, :destroy]
  resources :s_relationships, only: [:create, :destroy]
  resources :b_relationships, only: [:create, :destroy]
  resources :disclosures, only: [:index, :create, :edit, :update, :destroy]


  root to: 'static_pages#home' #root to　はroutes.rbの末尾に記載する。

end
