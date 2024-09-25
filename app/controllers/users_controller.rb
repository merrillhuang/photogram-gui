class UsersController < ApplicationController
  def show
    render("/user_templates/index")
  end
end
