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
end
