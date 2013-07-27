#encoding: utf-8
class Admin::SaleWinesController < Admin::AdminController

  load_and_authorize_resource :sale

  def index
    @sale = @sale.decorate
  end

end