class Cart < ActiveRecord::Base
has_many :line_items, dependent: :destroy
def add_nation(nation_id)
current_item = line_items.find_by(nation_id: nation_id)
if current_item
current_item.quantity += 1
else
current_item = line_items.build(nation_id: nation_id)
end
current_item
end
def total_population
line_items.to_a.sum { |item| item.total_population }
end
end
