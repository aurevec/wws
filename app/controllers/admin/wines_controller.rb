#encoding: utf-8
class Admin::WinesController < Admin::AdminController
  authorize_resource
  load_resource except: :create
  load_and_authorize_resource :house, through: :wine, shallow: true

  def index
    render "/admin/houses/wines/index" if @house
  end

  def new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to edit_admin_wine_url(@wine), notice: t("flash_messages.wine.create")
    else
      render :new
    end
  end

  def edit
    @wine
  end

  def update
    if @wine.update_attributes(wine_params)
      redirect_to edit_admin_wine_url(@wine), notice: t("flash_messages.wine.update")
    else
      render :edit
    end
  end

  def destroy
    @wine.destroy if @wine.destroyable?
    redirect_to admin_wines_url(), notice: t("flash_messages.wine.destroy")
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :designation, :vintage, :variety, :description, :house_id)
  end
end
