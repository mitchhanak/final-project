class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all

    render("episode_templates/index.html.erb")
  end

  def show
    @episode = Episode.find(params.fetch("id_to_display"))

    render("episode_templates/show.html.erb")
  end

  def new_form
    @episode = Episode.new
    if params.fetch("podcastid").nil?
      @podcast = nil
    else
      @podcast = params.fetch("podcastid")
    end
    render("episode_templates/new_form.html.erb")
  end

  def create_row
    @episode = Episode.new

    @episode.created_by = params.fetch("created_by")
    @episode.title = params.fetch("title")
    @episode.podcast_id = params.fetch("podcast_id")
##    @episode.audio = params.fetch("audio")
##    @episode.xml = params.fetch("xml")
    @episode.description = params.fetch("description")

    if @episode.valid?
      @episode.save
      redirect_to controller:'podcasts', action:'show', id: @episode.podcast_id
    else
      render("episode_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @episode = Episode.find(params.fetch("prefill_with_id"))

    render("episode_templates/edit_form.html.erb")
  end

  def update_row
    @episode = Episode.find(params.fetch("id_to_modify"))

    @episode.created_by = params.fetch("created_by")
    @episode.title = params.fetch("title")
    @episode.podcast_id = params.fetch("podcast_id")
    @episode.audio = params.fetch("audio")
    @episode.xml = params.fetch("xml")
    @episode.description = params.fetch("description")

    if @episode.valid?
      @episode.save

      redirect_to("/episodes/#{@episode.id}", :notice => "Episode updated successfully.")
    else
      render("episode_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @episode = Episode.find(params.fetch("id_to_remove"))

    @episode.destroy

    redirect_to("/episodes", :notice => "Episode deleted successfully.")
  end
end
