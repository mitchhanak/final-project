Rails.application.routes.draw do
  devise_for :users
  # Routes for the Ad permission resource:

  # CREATE
  get("/ad_permissions/new", { :controller => "ad_permissions", :action => "new_form" })
  post("/create_ad_permission", { :controller => "ad_permissions", :action => "create_row" })

  # READ
  get("/ad_permissions", { :controller => "ad_permissions", :action => "index" })
  get("/ad_permissions/:id_to_display", { :controller => "ad_permissions", :action => "show" })

  # UPDATE
  get("/ad_permissions/:prefill_with_id/edit", { :controller => "ad_permissions", :action => "edit_form" })
  post("/update_ad_permission/:id_to_modify", { :controller => "ad_permissions", :action => "update_row" })

  # DELETE
  get("/delete_ad_permission/:id_to_remove", { :controller => "ad_permissions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Placement resource:

  # CREATE
  get("/placements/new", { :controller => "placements", :action => "new_form" })
  post("/create_placement", { :controller => "placements", :action => "create_row" })

  # READ
  get("/placements", { :controller => "placements", :action => "index" })
  get("/placements/:id_to_display", { :controller => "placements", :action => "show" })

  # UPDATE
  get("/placements/:prefill_with_id/edit", { :controller => "placements", :action => "edit_form" })
  post("/update_placement/:id_to_modify", { :controller => "placements", :action => "update_row" })

  # DELETE
  get("/delete_placement/:id_to_remove", { :controller => "placements", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ad resource:

  # CREATE
  get("/ads/new", { :controller => "ads", :action => "new_form" })
  post("/create_ad", { :controller => "ads", :action => "create_row" })

  # READ
  get("/ads", { :controller => "ads", :action => "index" })
  get("/ads/:id_to_display", { :controller => "ads", :action => "show" })

  # UPDATE
  get("/ads/:prefill_with_id/edit", { :controller => "ads", :action => "edit_form" })
  post("/update_ad/:id_to_modify", { :controller => "ads", :action => "update_row" })

  # DELETE
  get("/delete_ad/:id_to_remove", { :controller => "ads", :action => "destroy_row" })

  #------------------------------

  # Routes for the Podcast resource:

  # CREATE
  get("/podcasts/new", { :controller => "podcasts", :action => "new_form" })
  post("/create_podcast", { :controller => "podcasts", :action => "create_row" })

  # READ
  get("/podcasts", { :controller => "podcasts", :action => "index" })
  get("/podcasts/:id_to_display", { :controller => "podcasts", :action => "show" })

  # UPDATE
  get("/podcasts/:prefill_with_id/edit", { :controller => "podcasts", :action => "edit_form" })
  post("/update_podcast/:id_to_modify", { :controller => "podcasts", :action => "update_row" })

  # DELETE
  get("/delete_podcast/:id_to_remove", { :controller => "podcasts", :action => "destroy_row" })

  #------------------------------

  # Routes for the Episode resource:

  # CREATE
  get("/episodes/new", { :controller => "episodes", :action => "new_form" })
  post("/create_episode", { :controller => "episodes", :action => "create_row" })

  # READ
  get("/episodes", { :controller => "episodes", :action => "index" })
  get("/episodes/:id_to_display", { :controller => "episodes", :action => "show" })

  # UPDATE
  get("/episodes/:prefill_with_id/edit", { :controller => "episodes", :action => "edit_form" })
  post("/update_episode/:id_to_modify", { :controller => "episodes", :action => "update_row" })

  # DELETE
  get("/delete_episode/:id_to_remove", { :controller => "episodes", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'ads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
