class Sale < ActiveRecord::Base

	belongs_to :house

	validates :house_id, presence: true

	def destroyable?
		true
	end
end
