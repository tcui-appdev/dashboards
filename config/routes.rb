Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "application", :action => "home" })
  get("/forex", { :controller => "currencies", :action => "forex" })
  get("/forex/:from_curr", { :controller => "currencies", :action => "from_curr" })
  get("/forex/:from_curr/:to_curr", { :controller => "currencies", :action => "to_curr" })
end
