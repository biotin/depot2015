class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|jpg|png)\Z}i,
	message: 'Only GIF, JPG and PNG.'
	}

	def self.latest
		Product.order(:updated_at).last
	end
	
	private 
	
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
		  return true
		else
		  errors.add(:base, 'Product Position Exist')
		  return false
		end
	end
end
