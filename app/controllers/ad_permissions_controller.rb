class AdPermissionsController < ApplicationController
  def index
    @ad_permissions = AdPermission.all

    render("ad_permission_templates/index.html.erb")
  end

  def show
    @ad_permission = AdPermission.find(params.fetch("id_to_display"))

    render("ad_permission_templates/show.html.erb")
  end

  def new_form
    @ad_permission = AdPermission.new

    render("ad_permission_templates/new_form.html.erb")
  end

  def create_row
    @ad_permission = AdPermission.new

    @ad_permission.ad_id = params.fetch("ad_id")
    @ad_permission.podcast_id = params.fetch("podcast_id")

    if @ad_permission.valid?
      @ad_permission.save

      redirect_back(:fallback_location => "/ad_permissions", :notice => "Ad permission created successfully.")
    else
      render("ad_permission_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ad_permission = AdPermission.find(params.fetch("prefill_with_id"))

    render("ad_permission_templates/edit_form.html.erb")
  end

  def update_row
    @ad_permission = AdPermission.find(params.fetch("id_to_modify"))

    @ad_permission.ad_id = params.fetch("ad_id")
    @ad_permission.podcast_id = params.fetch("podcast_id")

    if @ad_permission.valid?
      @ad_permission.save

      redirect_to("/ad_permissions/#{@ad_permission.id}", :notice => "Ad permission updated successfully.")
    else
      render("ad_permission_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @ad_permission = AdPermission.find(params.fetch("id_to_remove"))

    @ad_permission.destroy

    redirect_to("/ad_permissions", :notice => "Ad permission deleted successfully.")
  end
end
