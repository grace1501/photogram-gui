Rails.application.routes.draw do
  get("/", to: redirect("/users"))

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  
end
