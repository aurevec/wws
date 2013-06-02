class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string 	:name
      t.string 	:country
      t.string 	:region
      t.string 	:city
      t.text 		:description
      t.string	:website
      t.string	:facebook_link

    	t.timestamps
    end
  end
end
