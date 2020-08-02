Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :choices
  resources :opcaos

  resources :enquetes do
    collection do
      get :pagina_inicial
      get :classificacao
    end
  end

  root to: 'enquetes#pagina_inicial'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
