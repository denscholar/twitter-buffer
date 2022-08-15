Rails.application.routes.draw do
  get "about_us", to: "about#index", as: :about

  get "edit_password", to: "passwords#edit", as: :edit_password
  patch "edit_password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
   
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "reset_passwords#new"
  post "password/reset", to: "reset_passwords#create"  
  
  get "password/reset/edit", to: "reset_passwords#edit"
  patch "password/reset/edit", to: "reset_passwords#update"

  delete "/logout", to: "sessions#destroy"

  root "main#index"
end
