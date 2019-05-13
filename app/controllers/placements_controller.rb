class PlacementsController < ApplicationController
  def index
    @placements = Placement.all

    render("placement_templates/index.html.erb")
  end

  def show
    @placement = Placement.find(params.fetch("id_to_display"))

    render("placement_templates/show.html.erb")
  end

  def new_form
    @placement = Placement.new

    render("placement_templates/new_form.html.erb")
  end

  def create_row
    @placement = Placement.new

    @placement.position_x = params.fetch("position_x")
    @placement.position_y = params.fetch("position_y")
    @placement.ad_id = params.fetch("ad_id")
    @placement.episode_id = params.fetch("episode_id")
    @placement.created_by = params.fetch("created_by")
    @placement.timestamp_start = params.fetch("timestamp_start")
    @placement.timestamp_end = params.fetch("timestamp_end")

    if @placement.valid?
      @placement.save

      redirect_back(:fallback_location => "/placements", :notice => "Placement created successfully.")
    else
      render("placement_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @placement = Placement.find(params.fetch("prefill_with_id"))

    render("placement_templates/edit_form.html.erb")
  end

  def update_row
    @placement = Placement.find(params.fetch("id_to_modify"))

    @placement.position_x = params.fetch("position_x")
    @placement.position_y = params.fetch("position_y")
    @placement.ad_id = params.fetch("ad_id")
    @placement.episode_id = params.fetch("episode_id")
    @placement.created_by = params.fetch("created_by")
    @placement.timestamp_start = params.fetch("timestamp_start")
    @placement.timestamp_end = params.fetch("timestamp_end")

    if @placement.valid?
      @placement.save

      redirect_to("/placements/#{@placement.id}", :notice => "Placement updated successfully.")
    else
      render("placement_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @placement = Placement.find(params.fetch("id_to_remove"))

    @placement.destroy

    redirect_to("/placements", :notice => "Placement deleted successfully.")
  end
end
