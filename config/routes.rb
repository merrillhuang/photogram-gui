Rails.application.routes.draw do
  get("/", {controller: "users", action: "index"})

  get("/users", {controller: "users", action: "index"})
  post("/insert_user", {controller: "users", action: "create"})
end
