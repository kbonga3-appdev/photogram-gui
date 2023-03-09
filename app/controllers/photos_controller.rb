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
end
