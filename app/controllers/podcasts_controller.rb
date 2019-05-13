class PodcastsController < ApplicationController

  
  def index
    @podcasts = Podcast.all

    render("podcast_templates/index.html.erb")
  end

  def show
    @podcast = Podcast.find(params.fetch("id_to_display"))

    render("podcast_templates/show.html.erb")
  end

  def new_form
    @podcast = Podcast.new

    render("podcast_templates/new_form.html.erb")
  end

  def create_row
    @podcast = Podcast.new

##    @podcast.logo = params.fetch("logo")
    @podcast.title = params.fetch("title")
    @podcast.created_by = params.fetch("created_by")
    uploads = {}
    uploads[:uplogo] = Cloudinary::Uploader.upload(params.fetch("logo"), 
      :folder => "final2-051319/")
    @podcast.logo = uploads.first.fetch('url')
    

    if @podcast.valid?
      @podcast.save

      redirect_back(:fallback_location => "/podcasts", :notice => "Podcast created successfully.")
    else
      render("podcast_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @podcast = Podcast.find(params.fetch("prefill_with_id"))

    render("podcast_templates/edit_form.html.erb")
  end

  def update_row
    @podcast = Podcast.find(params.fetch("id_to_modify"))

    @podcast.created_by = params.fetch("created_by")
    @podcast.logo = params.fetch("logo")
    @podcast.title = params.fetch("title")

    if @podcast.valid?
      @podcast.save

      redirect_to("/podcasts/#{@podcast.id}", :notice => "Podcast updated successfully.")
    else
      render("podcast_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @podcast = Podcast.find(params.fetch("id_to_remove"))

    @podcast.destroy

    redirect_to("/podcasts", :notice => "Podcast deleted successfully.")
  end
end
