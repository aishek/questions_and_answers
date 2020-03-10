Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions, only: [:create, :show] do
    resources :answers, only: [:create]
  end
end
