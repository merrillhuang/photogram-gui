class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)

    render("/user_templates/index")
  end
end
