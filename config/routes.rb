Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'services#index';

  resource :services, only: [:index] do
    collection do
      get 'contact_done'
    end
  end

  resources :sagaserus, only: [:index] do
    collection do
      get 'contact'
      get 'contact_message'
    end
  end
  
  resources :kuraserus, only: [:index] do
    collection do
      get 'contact'
      get 'contact_message'
    end
  end
  

end