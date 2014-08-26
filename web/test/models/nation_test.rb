require 'test_helper'

class NationTest < ActiveSupport::TestCase
 fixtures :nations
 test "nation attributes must not be empty" do
nation = Nation.new
assert nation.invalid?
assert nation.errors[:country].any?
assert nation.errors[:capital].any?
assert nation.errors[:population].any?
assert nation.errors[:image_url].any?
assert nation.errors[:Flag_color].any?
end
test "nation population must be greater" do
nation = Nation.new(country: "Iraq",
Flag_color: "red and black",
capital: "bagdad",
image_url: "iraq.gif")

nation.population = 100
assert nation.invalid?
assert_equal ["must be greater than or equal to 1000"],
nation.errors[:population]
nation.population = 1050
assert nation.valid?
end


def new_nation(image_url)
Nation.new(country: "Iraq",
capital: "bagdad",
Flag_color: "red and black",
population: 10005060,
image_url: image_url)
end
test "image url" do
ok = %w{ iraq.gif iraq.jpg iraq.png iraq.JPG iraq.Jpg
http://a.b.c/x/y/z/iraq.gif }
bad = %w{ iraq.doc iraq.gif/more iraq.gif.more }
ok.each do |name|
assert new_nation(name).valid?, "#{name} should be valid"
end
bad.each do |name|
assert new_nation(name).invalid?, "#{name} shouldn't be valid"
end
end












test "nation is not valid without a unique country name - i18n" do
nation = Nation.new(country: nations(:england).country,
capital: "london",
population: 1345000,
image_url: "uk.gif",
Flag_color: "red star")
assert nation.invalid?
assert_equal [I18n.translate('errors.messages.taken')],
nation.errors[:country]
end


end
