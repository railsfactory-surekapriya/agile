require 'test_helper'
class OrderNotifierTest < ActionMailer::TestCase
test "received" do
mail = OrderNotifier.received(orders(:one))
 assert_equal "Pragmatic Store Order Confirmation", mail.subject
 assert_equal ["surekapriya@railsfactory.org"], mail.to
 assert_equal ["depot@example.com"], mail.from
 assert_match /1 x India/, mail.body.encoded
end
test "shipped" do
 mail = OrderNotifier.shipped(orders(:one))
 assert_equal "Pragmatic Store Order Shipped", mail.subject
 assert_equal ["surekapriya@railsfactory.org"], mail.to
 assert_equal ["depot@example.com"], mail.from
 assert_match /<td>1&times;<\/td>\s*<td><\/td>/,
 mail.body.encoded
end
end
