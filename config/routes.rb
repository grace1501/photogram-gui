Rails.application.routes.draw do
  get("/", to: redirect("/users"))
  
  get("/users", { :controller => "users", :action => "index" })
  
end
