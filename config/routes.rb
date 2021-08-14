Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
    end
  end
  root to: 'tops#index'
  get '/tops', to: 'tops#index'
end
