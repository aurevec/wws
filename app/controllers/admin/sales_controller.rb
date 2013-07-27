#encoding: utf-8
class Admin::SalesController < Admin::AdminController
  authorize_resource
  load_resource except: :create

  def index
    @sales = @sales.decorate
  end

  def new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to edit_admin_sale_url(@sale), notice: t("flash_messages.sale.create")
    else
      render :new
    end
  end

  def edit
    @sale = SaleDecorator.decorate(@sale)
  end

  def update
    if @sale.update_attributes(sale_params)
      redirect_to edit_admin_sale_url(@sale), notice: t("flash_messages.sale.update")
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy if @sale.destroyable?
    redirect_to admin_sales_url(), notice: t("flash_messages.sale.destroy")
  end

  private

  def sale_params
    params.require(:sale).permit! #(:house_id, :begin_date, :end_date, :limit_for_validation, :limit_date, :sale_wines_attributes)
  end
end
