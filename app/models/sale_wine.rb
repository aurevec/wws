class SaleWine < ActiveRecord::Base

	belongs_to :sale
	belongs_to :wine

	validates :sale_id, :wine_id, presence: true

	def destroyable?
		true
	end
end
