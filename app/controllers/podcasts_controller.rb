class PodcastsController < ApplicationController
  
  def index
    @podcasts = current_user.podcasts

    render("podcast_templates/index.html.erb")
  end

  def show
    @podcast = Podcast.find(params.fetch("id_to_display"))
    @owner = User.where({ :id => @podcast.created_by }).at(0)

    render("podcast_templates/show.html.erb")
  end

  def new_form
    @podcast = Podcast.new

    render("podcast_templates/new_form.html.erb")
  end

  def create_row
    @podcast = current_user.podcasts.new

    @podcast.logo = params[:logo]
    @podcast.title = params[:title]
    
    if @podcast.valid?
      @podcast.save

      redirect_to("/podcasts/" + @podcast.id.to_s)
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
    if current_user == @podcast.created_by
      @podcast.destroy
      redirect_to("/podcasts", :notice => "Podcast deleted successfully.")
    else
    redirect_to("/podcasts/#{@podcast.id}", :notice => "Only owner can delete.")
    end
  end
end
