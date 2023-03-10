class UsersController < ApplicationController
      def index
       matching_users = User.all
       @list_of_users = matching_users.order({ :username => :asc })
      render({ :template => "user_templates/index.html.erb"})
      end 

      def show
          # {"path_username"=>"anisa"}
      dynamicurl_user = params.fetch("path_username")
      matching_usernames = User.where({ :username => dynamicurl_user })
      @the_user = matching_usernames.first

      if @the_user == nil
          redirect_to("/404", status: 404)
      else
      render({ :template => "user_templates/show.html.erb"})
      end
     end

     def adduser
        # Parameters: {"val_query_image"=>"", "val_query_caption"=>"", "val_query_ownerid"=>""}

        newuser_input = params.fetch("input_username")
        new_user = User.new
        new_user.username = newuser_input
        new_user.save

       
        redirect_to("/users/" + new_user.username.to_s )
        
    end

   def edituser
    # input_username
    the_id = params.fetch("userupdate")
    userupdate = User.where({ :id => the_id}).at(0)
    
    new_username = params.fetch("input_username")
    userupdate.username = new_username
    userupdate.save


     redirect_to("/users/" + userupdate.username.to_s )
   end

end







 #   render({ :template => "user_templates/adduser.html.erb" })
        # redirect_to("/photos/" + new_photo.id.to_s )

 # @the_user.id 
    # c = User.where({ :id => 2 }).first
    #     updateuser_input = params.fetch("name")
    #     new_user = User.where({ :id => User.ids})
    #     new_user.username = updateuser_input
    #      new_user.save
