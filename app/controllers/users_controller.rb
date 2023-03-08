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
end
