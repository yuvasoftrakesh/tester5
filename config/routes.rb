Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 root "articles#index"
      resources :articles do
        resources :likes
      end
      
post '/article', to: 
"articles#post_form"
    #post '/article', to: "articles#post_form"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
