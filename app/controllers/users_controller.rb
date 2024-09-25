class UsersController < ApplicationController
  def index
    render("/user_templates/index")
  end
end
