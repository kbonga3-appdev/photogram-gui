Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })

  get("/user/:new_user", { :controller => "users", :action => "adduser" })

   get("/update_user/:userupdate", { :controller => "users", :action => "edituser" })



  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photoid", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_photodel", { :controller => "photos", :action => "photodeletion" })
  get("/insert_photo_record", { :controller => "photos", :action => "addphoto" })
  get("/update_photo/:update_photo_id", { :controller => "photos", :action => "updatephoto" })

  get("/insert_comment_record", { :controller => "photos", :action => "insert_comment" })

  
  
  



end
