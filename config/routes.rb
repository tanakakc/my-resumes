Rails.application.routes.draw do
  resources :resumes
  devise_for :users
  resources :work_histories, except: [:index, :show]

  authenticated :user do
    root 'resumes#index', as: :authenticated_root
  end

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
