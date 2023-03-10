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

     def updatephoto

          # Parameters: {"input_image"=>"https://www.dreamstime.com/photos-images/bikini-girl.html", "input_caption"=>"https://www.dreamstime.com/photos-images/bikini-girl.html", "update_photo_id"=>"952"}

        the_id = params.fetch("update_photo_id")
                        
       

       matching_photos = Photo.where({ :id => the_id})
      
       the_photo = matching_photos.at(0)

       image_input = params.fetch("input_image")
       caption_input = params.fetch("input_caption")
     #   owner_input = params.fetch("val_query_ownerid")


     the_photo.image = image_input
     the_photo.caption = caption_input

     the_photo.save

     redirect_to("/photos/" + the_photo.id.to_s)
    # render({ :template => "photo_templates/update.html.erb" })

     end


     def insert_comment

     photoid = params.fetch("input_photo_id")

     commentupdate = Comment.new
     
     comments = params.fetch("input_body")
     authorid = params.fetch("input_author_id")
     
     commentupdate.photo_id = photoid
     commentupdate.body = comments
     commentupdate.author_id = authorid
     commentupdate.save




         
     redirect_to("/photos/" + photoid.to_s)

     end
end
