class AddTimestampsToWines < ActiveRecord::Migration
  def change
  	add_timestamps :wines
  end
end
