class CatalogsController < ApplicationController
  def index
    if params[:current_path] && params[:current_path] != 'root'
      @current_path = params[:current_path]
      @catalogs = Catalog.find_by(path: @current_path).children
    else
      @current_path = ''
      @catalogs = Catalog.roots.sort
    end
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      respond_to(:turbo_stream)
    else
      respond_with_errors(@catalog)
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update(catalog_params)
      redirect_to_index
    else
      respond_with_errors(@catalog)
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
    flash.now[:notice] = I18n.t(:delete)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to catalogs_url, status: :ok }
    end
  end

  private

  def catalog_params
    params.require(:catalog).permit(:path)
  end

  def respond_with_errors(obj)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('errors', partial: 'shared/error_messages',
                                                           locals: { obj: })
      end
      format.html { redirect_to catalogs_url, status: :unprocessable_entity }
    end
  end

  def redirect_to_index
    redirect_to catalogs_path(current_path: helpers.previous_path(params[:catalog][:path]))
  end
end
