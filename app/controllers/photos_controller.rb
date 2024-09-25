class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(:created_at, "desc")

    render("photos_template/index")
  end
end
