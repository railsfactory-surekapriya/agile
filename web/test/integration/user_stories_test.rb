require 'test_helper'
class UserStoriesTest < ActionDispatch::IntegrationTest
fixtures :nations
# A user goes to the index page. They select a nation, adding it to their
# cart, and check out, filling in their details on the checkout form. When
# they submit, an order is created containing their information, along with a
# single line item corresponding to the nation they added to their cart.

test "buying a product" do
LineItem.delete_all
Order.delete_all
england_book = nations(:england)

get "/"
assert_response :success
assert_template "index"

xml_http_request :post, '/line_items', nation_id: england_book.id
assert_response :success

cart = Cart.find(session[:cart_id])
assert_equal 1, cart.line_items.size
assert_equal england_book, cart.line_items[0].nation

get "/orders/new"
assert_response :success
assert_template "new"

post_via_redirect "/orders",
order: { name: "sureka",
address: "xxxx yyyy",
email: "surekapriya@railsfactory.org",
pay_type: "Check" }

assert_response :success
assert_template "index"
cart = Cart.find(session[:cart_id])
assert_equal 0, cart.line_items.size

orders = Order.all
assert_equal 1, orders.size
order = orders[0]
assert_equal "sureka", order.name
assert_equal "xxxx yyyy", order.address
assert_equal "surekapriya@railsfactory.org", order.email
assert_equal "Check", order.pay_type

assert_equal 1, order.line_items.size
line_item = order.line_items[0]
assert_equal england_book, line_item.nation

mail = ActionMailer::Base.deliveries.last
assert_equal ["surekapriya@railsfactory.org"], mail.to
assert_equal 'sam ruby <depot@example.com>', mail[:from].value
assert_equal "Pragmatic Store Order Confirmation", mail.subject
end
end
