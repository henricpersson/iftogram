Iftogram::Application.routes.draw do
  get "oauth/auth"
  get "oauth/connect"
  get "oauth/logout"

  #match 'profile/:id' => 'profile#view'
  match 'profile/:id' => 'profile#view', :as => :profile
  get "search/index"
  get "search/result", :controller => :search, :action => :index
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'search#index'
end
