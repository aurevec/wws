#encoding: utf-8
class Admin::HouseWinesController < Admin::AdminController

  load_and_authorize_resource :house

  def index
  end

end