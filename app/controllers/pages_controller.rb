class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(1)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
     redirect pages_path(@page.id)
    else
      render :new
  end
end

def edit
  @page = Page.find(params[:id])
end

private

  def page_params
  params.require(:page).permit(:title, :author, :body)
  end

end