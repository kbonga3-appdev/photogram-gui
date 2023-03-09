class PhotosController < ApplicationController
     def index
          photo_match = Photo.all
           @list_of_photos =  photo_match.order({ :created_at => :desc})


      render({ :template => "photo_templates/index.html.erb"})
     end

     def show
          # Parameters: {"path_photoid"=>"785"}
          url_id = params.fetch("path_photoid")
         matching_photos =  Photo.where({ :id => url_id })
         @the_photo =  matching_photos.at(0)

        render({ :template => "photo_templates/show.html.erb" })  
     end

     def photodeletion
          # Parameters: {"path_photodel"=>"777;"}
          the_id = params.fetch("path_photodel")
          matching_photos = Photo.where({ :id => the_id })
          the_photo = matching_photos.at(0)
          the_photo.destroy
           redirect_to("/photos")
          #  render({ :template => "photo_templates/deletephoto.html.erb" })  
     end

     def addphoto
          # Parameters: {"val_query_image"=>"", "val_query_caption"=>"", "val_query_ownerid"=>""}

          image_input = params.fetch("val_query_image")
          caption_input = params.fetch("val_query_caption")
          owner_input = params.fetch("val_query_ownerid")

          new_photo = Photo.new

          new_photo.image = image_input
          new_photo.caption = caption_input
          new_photo.owner_id = owner_input

          new_photo.save

          # render({ :template => "photo_templates/addphotos.html.erb" })

          redirect_to("/photos/" + new_photo.id.to_s )
     end
end
