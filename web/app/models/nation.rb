class Nation < ActiveRecord::Base
validates :country, :capital, :image_url, :population, :Flag_color,  presence: true
validates :population, numericality: {greater_than_or_equal_to: 1000}
validates :country, uniqueness: true
validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png|jpeg)\Z}i, message: "your image format is wrong use gif or jpg or png" }
end

