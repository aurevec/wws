class House < ActiveRecord::Base

	has_many :wines

	def destroyable?
		true
	end
end
