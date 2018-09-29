Rails.application.routes.draw do
  resources :subjects do
    resources :sections do
      resources :qns do
        resources :qs do
        end
      end
    end
    resources :ans
  end

  #devise_for :users, path: '',
    #only: [:session, :confirmation, :password],
    #controllers: {
      #sessions: 'users/sessions',
      #confirmations: 'users/confirmations'
    #},
    #path_names: {
      #sign_in: 'login',
      #sign_out: 'logout'
    #}

  root to: 'subjects#index'
end
