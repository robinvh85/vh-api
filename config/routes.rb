Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests do
    collection do
      post :download
      get :create_file
      get :get_file
    end
  end
end
