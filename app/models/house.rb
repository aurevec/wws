class House < ActiveRecord::Base

	def destroyable?
		true
	end
end
