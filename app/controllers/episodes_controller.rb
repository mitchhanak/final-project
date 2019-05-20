class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all

    render("episode_templates/index.html.erb")
  end

  def show
    @episode = Episode.find(params.fetch("id_to_display"))
    @podcast = Podcast.find(@episode.podcast_id)
    @placements = Placement.where({ :episode_id => @episode.id }).order(:created_at => :desc)

    render("episode_templates/show.html.erb")
  end

  def new_form
    @podcast = Podcast.where({ :id => params.fetch("podcastid")}).at(0)
    render("episode_templates/new_form.html.erb")
  end

  def create_row
    @podcast = Podcast.where({ :id => params.fetch("podcastid")}).at(0)
    @episode = current_user.episodes.new

    @episode.title = params.fetch("title")
    @episode.podcast_id = @podcast.id
##    @episode.audio = params.fetch("audio")
##    @episode.xml = params.fetch("xml")
    @episode.description = params.fetch("description")

    if @episode.valid?
      @episode.save
      redirect_to("/episodes/" + @episode.id.to_s)
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
