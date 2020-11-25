class WikisController < ApplicationController

  before_action :authenticate_user!, only: [:like]

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      redirect_to @wiki
    else
      render 'new'
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
    commontator_thread_show(@wiki)
  end

  def index
    @wikis= Wiki.page params[:page]
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
      flash[:success] = "Task Updated!"
    else
      render action: :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    redirect_to :action => :index
  end

  def like
    @wiki= Wiki.find(params[:id])
    if current_user.voted_for? @wiki
      @wiki.unliked_by current_user
    else
      @wiki.liked_by current_user
    end
  end
  private
    def wiki_params
      params.require(:wiki).permit(:id,:title, :content, :description)
    end
end
