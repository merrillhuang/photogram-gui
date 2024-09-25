class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: "desc")

    render("photo_templates/index")
  end

  def create
    new_photo = Photo.new(
      {
        image: params.fetch("query_image_url"),
        caption: params.fetch("query_caption"),
        owner_id: params.fetch("query_owner_id")
      }
    )

    if new_photo.valid?
      new_photo.save
      redirect_to("/photos", {notice: "Photo created successfully"})
    else
      redirect_to("/photos", {notice: "Photo failed to create successfully"})
    end
  end

  def details
    photo_id = params.fetch("id")

    photo = Photo.where({id: photo_id}).at(0)

    render("/photo_templates/details")
  end
end
