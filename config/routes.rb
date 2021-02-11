Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'services#index';

  resources :sagaserus, only: [:index] do
    collection do
      get 'contact'
    end
  end

  resources :kuraserus, only: [:index] do
    collection do
      get 'contact'
    end
  end
  
  resources :inquiries, only: [:index] do
    collection do
      post 'confirm'
      post 'done'
    end
  end
  

end