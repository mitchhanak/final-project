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
    @episode = Episode.find(params.fetch("episodeid"))

    render("placement_templates/new_form.html.erb")
  end

  def create_row
    @placement = current_user.placements.new
    @episode = Episode.find(params.fetch("episodeid"))

    @placement.position_x = params.fetch("posx")
    @placement.position_y = params.fetch("posy")
    @placement.ad_id = params.fetch("ad_id")
    @placement.episode_id = @episode.id
    @placement.created_by = current_user.id
    @placement.timestamp_start = params.fetch("start")
    @placement.timestamp_end = params.fetch("end")
    @placement.width = params.fetch("width")
    @placement.height = params.fetch("height")

    if @placement.valid?
      @placement.save

      redirect_to("/placements/new/#{@episode.id}")
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
    @episode = Episode.find(@placement.episode_id)
    if current_user.id == @placement.created_by
      @placement.destroy
      redirect_to("/placements/new/#{@episode.id}", :notice => "Placement deleted successfully.")
    else
      redirect_to("/placements/#{@placement.id}", :notice => "Only owner can delete.")
    end
  end
end
