Rails.application.routes.draw do

  root 'films#index'

  resources :films do
    resources :opinions
  end

end
