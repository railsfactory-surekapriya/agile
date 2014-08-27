atom_feed do |feed|
feed.country "Who bought #{@nation.country}"
feed.updated @latest_order.try(:updated_at)
@nation.orders.each do |order|
feed.entry(order) do |entry|
entry.country "Order #{order.id}"
entry.summary type: 'xhtml' do |xhtml|
xhtml.p "Shipped to #{order.address}"
xhtml.table do
xhtml.tr do
xhtml.th 'Nation'
xhtml.th 'Quantity'
xhtml.th 'Total Population'
end
order.line_items.each do |item|
xhtml.tr do
xhtml.td item.nation.country
xhtml.td item.quantity
xhtml.td item.total_population
end
end
xhtml.tr do
xhtml.th 'total', colspan: 2
xhtml.th order.line_items.map(&:total_population).sum
end
end
xhtml.p "Paid by #{order.pay_type}"
end
entry.author do |author|
author.name order.name
author.email order.email
end
end
end
end
