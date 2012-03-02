Eeservice::Application.routes.draw do


  get "admin/login"
  get "admin/logout"
  get "admin/index"


  match "/mains/whyUS/" => "mains#whyUs"
  match "/mains/about/" => "mains#about"
  match "/mains/rate/" => "mains#rate"
  match "/mains/how/" => "mains#how"
  match "/mains/soon/" => "mains#soon"

  resources :mains
  resources :users
  resources :msg

  root :to => "mains#index"


  match "/logs/iAdd/" => "logs#iAdd"
  match "/logs/jsonAdd/" => "logs#jsonAdd"


 # match "/admin/ilogin/:name/:password" => "admin#iLogin"
  match ':controller(/:action(/:id(.:format)))'
end
