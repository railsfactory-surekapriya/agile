class LineItem < ActiveRecord::Base
  belongs_to :nation
  belongs_to :cart
def total_population
nation.population * quantity
end
end
