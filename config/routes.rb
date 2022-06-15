Rails.application.routes.draw do
  root "enapsa_monthly_reports#new"
  get "/enapsa_monthly_report/new", to: "enapsa_monthly_reports#new"
  post "/enapsa_monthly_report/download", to: "enapsa_monthly_reports#download"
  get "/enapsa_monthly_report/show", to: "enapsa_monthly_reports#show"
  resources :employers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
