require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'

class CustomerTest < Minitest::Test

  def test_it_exists
    joel = Customer.new("Joel", 2)

    assert_instance_of Customer, joel
  end

  def test_it_has_readable_attributes
    joel = Customer.new("Joel", 2)

    assert_equal "Joel", joel.name
    assert_equal 2, joel.id
  end

  def test_can_adopt_pets
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    assert_equal [], joel.pets

    joel.adopt(samson)
    joel.adopt(lucy)

    assert_equal [samson, lucy], joel.pets
  end
end



# ## Iteration 2
#
# Use TDD to create a `Customer` class that responds to the following interaction pattern:
#
# joel.outstanding_balance
# # => 0
#
# joel.charge(15)
#
# joel.charge(7)
#
# joel.outstanding_balance
# # => 22
