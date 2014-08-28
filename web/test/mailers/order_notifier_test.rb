require 'test_helper'
class OrderNotifierTest < ActionMailer::TestCase
test "received" do
mail = OrderNotifier.received(orders(:one))
 assert_equal "Pragmatic Store Order Confirmation", mail.subject
 assert_equal ["depot@example.com"], mail.to
 assert_equal ["surekapriya@railsfactory.org"], mail.from
 assert_match /1 x UK/, mail.body.encoded
end
test "shipped" do
 mail = OrderNotifier.shipped(orders(:one))
 assert_equal "Pragmatic Store Order Shipped", mail.subject
 assert_equal ["depot@example.com"], mail.to
 assert_equal ["surekapriya@railsfactory.org"], mail.from
 assert_match /<td>1&times;<\/td>\s*<td>UK<\/td>/,
 mail.body.encoded
end
end
