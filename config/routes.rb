Rails.application.routes.draw do
  root 'doctors#index'

  devise_for :doctors
  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :appointments, except: [:show, :index]
  resources :doctors, only: [:show, :edit, :update, :index]
  resources :doctor_specializations
  resources :specializations
end
