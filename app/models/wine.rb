class Wine < ActiveRecord::Base

	belongs_to :house

	has_many :sale_wines
	has_many :wines, through: :sale_wines

	validates :house_id, presence: true

	def destroyable?
		true
	end
end
