class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
    	t.integer			:house_id
    	t.datetime		:begin_date
    	t.datetime		:end_date
    	t.integer     :limit_for_validation
    	t.datetime    :limit_date

    	t.timestamps
    end
  end
end
