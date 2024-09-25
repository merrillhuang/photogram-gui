Rails.application.routes.draw do
  get("/", {controller: "users", action: "index"})

  get("/users", {controller: "users", action: "index"})
  post("/insert_user", {controller: "users", action: "create"})
  get("/users/:username", {controller: "users", action: "details"})
  post("/update_user/:username", {controller: "users", action:"update"})

  get("/photos", {controller: "photos", action: "index"})
end
