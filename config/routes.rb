Rails.application.routes.draw do
  root to: 'pages#welcome'

  resources :companies do
    resources :subscriptions
    post 'subscriptions/download', to: 'subscriptions#download'
    resources :subscriptions do
      collection do
        delete 'delete_all'
      end
    end


    resources :invalid_subscriptions
    post 'invalid_subscriptions/download', to: 'invalid_subscriptions#download'
    resources :invalid_subscriptions do
      collection do
        delete 'delete_all'
      end
    end
  end

  get '/:company', to: 'companies#show'
  post 'companies/upload', to: 'companies#upload'
  # delete '/company/:company/subscriptions', to: 'subscriptions#destroy'

  post '/', to: 'sessions#create'
end
