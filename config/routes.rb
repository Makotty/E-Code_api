Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User',
                                  at: 'auth',
                                  controllers: {
                                    registrations: 'api/v1/auth/registrations',
                                  }

      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :users, only: %i[index show]
      resources :episodes
      resources :user_episodes
      resources :episode_comments
    end
  end
end
