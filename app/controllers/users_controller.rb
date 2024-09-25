class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)

    render("/user_templates/index")
  end
  
  def create
    new_user = User.new({username: params.fetch("query_username")})

    if new_user.valid?
      new_user.save
      redirect_to("/users/#{new_user.username}", {notice: "User created successfully"})
    else
      redirect_to("/users", {notice: "User failed to create successfully"})
    end
  end

  def details
    username = params.fetch("username")

    @user = User.where({username: username}).at(0)

    render("/user_templates/details")
  end

  def update
    original_username = params.fetch("username")

    update_user = User.where({username: original_username}).at(0)

    new_username = params.fetch("query_username")

    update_user.username = new_username

    if update_user.valid?
      update_user.save
      redirect_to("/users/#{new_username}", {notice: "User updated successfully"})
    else
      redirect_to("/users/#{original_username}", {notice: "User failed to update successfully"})
    end
  end
end
