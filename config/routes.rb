Rails.application.routes.draw do
  scope :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'current_user_data' => 'v1/user#current_user_data', as: "current_user_data"

    resources :posts
  end
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
