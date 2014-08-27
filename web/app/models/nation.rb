class Nation < ActiveRecord::Base
has_many :orders, through: :line_items
has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item
validates :country, :capital, :image_url, :population, :Flag_color,  presence: true
validates :population, numericality: {greater_than_or_equal_to: 1000}
validates :country, uniqueness: true
validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png|jpeg)\Z}i, message: "your image format is wrong use gif or jpg or png" }


def self.latest
Nation.order(:updated_at).last
end
private
def ensure_not_referenced_by_any_line_item
 if line_items.empty?
 return true
 else
 errors.add(:base, 'Line Items present')
 return false
 end
 end
end

