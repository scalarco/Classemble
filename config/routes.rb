Assemble::Application.routes.draw do
  resources :projects
  resources :user_to_skills
  resources :user_to_interests
  resources :project_to_skills
  resources :applications
  
  match '/myprojects', to: "projects#myprojects"
  match '/myapplications', to: "applications#myapplications"
  match '/candidates', to: "projects#candidates"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end