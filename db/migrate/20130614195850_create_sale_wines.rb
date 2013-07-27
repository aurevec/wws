class CreateSaleWines < ActiveRecord::Migration
  def change
    create_table :sale_wines do |t|
    	t.integer :sale_id
    	t.index :sale_id
    	t.foreign_key :sales

    	t.integer :wine_id
    	t.index :wine_id
    	t.foreign_key :wines

    	t.timestamps
    end
  end
end
