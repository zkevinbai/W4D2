Rails.application.routes.draw do
  resources :cats do 
    resources :cat_rental_requests, only: :new
  end
  resources :cat_rental_requests, only: :create
end