class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order(:created_at => :desc)

    render( :template => "photo_templates/index")
  end

  def show
    input_id = params.fetch("path_id")
    @the_photo = Photo.where( :id => input_id).at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
      render( :template => "photo_templates/show")
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photo = Photo.find_by(:id => the_id)

    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save

    # render( { :template => "photo_templates/create" })
    redirect_to("/photos/#{a_new_photo.id}")
  end

end
