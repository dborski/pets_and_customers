require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

class GroomerTest < Minitest::Test

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

  def test_can_count_number_of_pets_by_type
    groomer1 = Groomer.new("Lloyd Christmas")
    joel = Customer.new("Joel", 2)
    frank = Customer.new("Frank", 3)
    elanore = Customer.new("Elanore", 4)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    chester = Pet.new({name: "Chester", type: :dog, age: 15})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    diamond = Pet.new({name: "Diamond", type: :snake, age: 7})
    tweety = Pet.new({name: "Tweety", type: :bird, age: 40})

    groomer1.new_customer(joel)
    groomer1.new_customer(frank)
    groomer1.new_customer(elanore)
    frank.adopt(samson)
    frank.adopt(lucy)
    joel.adopt(tweety)
    joel.adopt(diamond)
    elanore.adopt(chester)

    assert_equal 1, groomer1.pets_by_type(:cat)
    assert_equal 2, groomer1.pets_by_type(:dog)
    assert_equal 1, groomer1.pets_by_type(:snake)
    assert_equal 1, groomer1.pets_by_type(:bird)
  end

  def test_charging_customer_creates_record
    groomer1 = Groomer.new("Lloyd Christmas")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})

    groomer1.charge_customer(joel, "#001", 10, "hair cut", samson)
    expected = [["#001" => {customer_name: "Joel", invoice_amount: 10, service: "hair cut", pet: samson}]]

    assert_equal expected, groomer1.charges

    groomer1.charge_customer(joel, "#002", 50, "washing", lucy)
    expected2 = [["#001" => {customer_name: "Joel", invoice_amount: 10, service: "hair cut", pet: samson}], ["#002" => {customer_name: "Joel", invoice_amount: 50, service: "washing", pet: lucy}]]

    assert_equal expected2, groomer1.charges
  end
end
