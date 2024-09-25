class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)

    render("/user_templates/index")
  end
  
  def create
    new_user = User.new({username: params.fetch("query_username")})

    if new_user.valid?
      new_user.save
      redirect_to("/users", {notice: "User created successfuly"})
    else
      redirect_to("/users", {notice: "User failed to create successfully"})
    end
  end

  def details
    username = params.fetch("username")

    @user = User.where({username: username})

    render("/user_templates/details")
  end
end
