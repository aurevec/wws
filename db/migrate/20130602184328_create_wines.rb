class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
    	t.string 	:name
    	t.string 	:designation
    	t.string 	:vintage
    	t.string 	:variety
    	t.text 	 	:description
    	t.integer :house_id
    	t.index   :house_id
    	t.foreign_key :houses
    end
  end
end
