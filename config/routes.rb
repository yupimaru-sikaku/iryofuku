Rails.application.routes.draw do
  
  get 'companies/show'
  root to: 'services#index';

  # 病院・相談支援側
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  # 事業所側
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  resources :companies, only: [:show]
  
  resource :services, only: [:index] do
    collection do
      get 'contact_done'
    end
  end

  resources :sagaserus, only: [:index, :new, :create] do
    resource :favorites, only: [:create, :destroy]
    resources :favorites, only: [:index]
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

  resources :ghs, only: [:new, :create, :index] do
    collection do
      get 'lists_company_ghs'
    end
  end
  

end