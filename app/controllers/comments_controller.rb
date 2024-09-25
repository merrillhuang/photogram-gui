class CommentsController < ApplicationController
  def create

    photo_id = params.fetch("query_photo_id")

    new_comment = Comment.new(
      {
        photo_id: photo_id,
        author_id: params.fetch("query_author_id"),
        body: params.fetch("query_comment_body")
      }
    )

    if new_comment.valid?
      new_comment.save
      redirect_to("/photos/#{photo_id}", notice: "Comment created successfully")
    else
      redirect_to("/photos/#{photo_id}", notice: "Comment failed to create successfully")
    end
  end
end
