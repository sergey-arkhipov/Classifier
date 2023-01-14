class CatalogsController < ApplicationController
  def index
    if params[:current_path] && params[:current_path] != 'root'
      # && !Catalog.find_by(path: params[:current_path]).root?
      @current_path = params[:current_path]
      @catalogs = Catalog.find_by(path: @current_path).children
    else
      @current_path = 'Каталоги'
      @catalogs = Catalog.roots.sort
    end
  end

  def new
    @catalog = Catalog.new
    @current_path = params[:current_path]
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def create
    @catalog = Catalog.create!(catalog_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to catalogs_path }
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update!(catalog_params)
      redirect_to catalogs_path(current_path: helpers.previous_path(params[:catalog][:path]) )
    else
      render edit
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
    flash.notice = 'Delete catalog item'
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to catalogs_url, notice: 'Successfully destroyed survey.' }
    end
  end

  private

  def catalog_params
    params.require(:catalog).permit(:path)
  end
end
