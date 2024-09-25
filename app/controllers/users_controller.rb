class UsersController < ApplicationController
  def index
    @users = User.all

    render("/user_templates/index")
  end
end
