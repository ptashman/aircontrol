Rails.application.routes.draw do
  resources :airqueues do
    collection do
      post :dequeue_one
    end
  end

  resources :aircrafts
  patch '/aircrafts/:id/enqueue', to: 'aircrafts#enqueue'

  root 'airqueues#index'

end
