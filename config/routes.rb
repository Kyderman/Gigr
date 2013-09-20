GigApp::Application.routes.draw do
  resources :instruments


  resources :events


  resources :bands


  resources :venues


  resources :musicians
  
 


  mount StripeEvent::Engine => '/stripe'
  get "content/band"
  get "content/musician"
  get "content/venue"


  resources :bands_musician do
    get :req
  get :reject
  get :accept
end
 

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
end