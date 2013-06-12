class House < ActiveRecord::Base

	has_many :wines
	has_many :sales

	def destroyable?
		true
	end
end
