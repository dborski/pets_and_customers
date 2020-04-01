require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

class GroomerTest < Minitest::Test

  def test_instance_stash
    skip
    # groomer1 = Groomer.new("Lloyd Christmas")
    # joel = Customer.new("Joel", 2)
    # frank = Customer.new("Frank", 3)
    # elanore = Customer.new("Elanore", 4)
    # samson = Pet.new({name: "Samson", type: :dog, age: 3})
    # lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    # chester = Pet.new({name: "Chester", type: :snake, age: 2})
  end

  def test_it_exists
    groomer1 = Groomer.new("Lloyd Christmas")

    assert_instance_of Groomer, groomer1
  end

  def test_it_has_readable_attributes
    groomer1 = Groomer.new("Lloyd Christmas")

    assert_equal "Lloyd Christmas", groomer1.name
  end

  def test_can_have_customers
    groomer1 = Groomer.new("Lloyd Christmas")
    joel = Customer.new("Joel", 2)
    frank = Customer.new("Frank", 3)

    assert_equal [], groomer1.customers

    groomer1.new_customer(joel)
    assert_equal [joel], groomer1.customers

    groomer1.new_customer(frank)
    assert_equal [joel, frank], groomer1.customers
  end

  def test_check_for_outstanding_balances
    groomer1 = Groomer.new("Lloyd Christmas")
    joel = Customer.new("Joel", 2)
    frank = Customer.new("Frank", 3)
    elanore = Customer.new("Elanore", 4)

    groomer1.new_customer(joel)
    groomer1.new_customer(frank)
    groomer1.new_customer(elanore)

    joel.charge(5)
    elanore.charge(15)

    assert_equal [joel, elanore], groomer1.customers_with_oustanding_balance
  end
end
