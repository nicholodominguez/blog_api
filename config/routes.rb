Rails.application.routes.draw do
  resources :blogs do
    collection do
      get :search
    end
  end
end
