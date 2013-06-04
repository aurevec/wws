#encoding: utf-8
class Admin::HousesController < Admin::AdminController
  authorize_resource
  load_resource except: :create

  def index
  end

  def new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to edit_admin_house_url(@house), notice: t("flash_messages.house.create")
    else
      render :new
    end
  end

  def edit
    @house
  end

  def update
    if @house.update_attributes(house_params)
      redirect_to edit_admin_house_url(@house), notice: t("flash_messages.house.update")
    else
      render :edit
    end
  end

  def destroy
    @house.destroy if @house.destroyable?
    redirect_to admin_houses_url(), notice: t("flash_messages.house.destroy")
  end

  private

  def house_params
    params.require(:house).permit(:name, :country, :region, :city, :description, :website, :facebook_link)
  end
end
