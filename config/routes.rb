Rails.application.routes.draw do
  root "enapsa_monthly_reports#new"
  
  get "/enapsa_monthly_report/new", to: "enapsa_monthly_reports#new"
  post "/enapsa_monthly_report/create", to: "enapsa_monthly_reports#create"
  get "/enapsa_monthly_report/show", to: "enapsa_monthly_reports#show"
  get "/enapsa_monthly_report/download_csv", to: "enapsa_monthly_reports#download_csv" #  needs refactoring
  
  resources :employers do
    resources :employees
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
