class Sale < ActiveRecord::Base

	belongs_to :house

	has_many :sale_wines
	has_many :wines, through: :sale_wines

  accepts_nested_attributes_for :sale_wines, :reject_if => :all_blank, :allow_destroy => true

	validates :house_id, presence: true

	def destroyable?
		true
	end
end
