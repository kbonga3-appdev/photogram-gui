class PhotosController < ApplicationController
     def index
          photo_match = Photo.all
           @list_of_photos =  photo_match.order({ :created_at => :desc})


      render({ :template => "photo_templates/index.html.erb"})
     end
end
