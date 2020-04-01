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
end
