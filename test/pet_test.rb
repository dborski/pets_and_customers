require 'minitest/autorun'
require 'minitest/pride'
require './lib/pet'

class PetTest < Minitest::Test

  def test_it_exists
    samson = Pet.new({name: "Samson", type: :dog, age: 3})

    assert_instance_of Pet, samson
  end

  def test_it_has_readable_attributes
    samson = Pet.new({name: "Samson", type: :dog, age: 3})

    assert_equal "Samson", samson.name
    assert_equal :dog, samson.type
    assert_equal 3, samson.age
  end

  def test_feeding_pet_changes_fed_to_true
    samson = Pet.new({name: "Samson", type: :dog, age: 3})

    assert_equal false, samson.fed?

    samson.feed

    assert_equal true, samson.fed?
  end
end


# ## Iteration 1
#
# Use TDD to create a `Pet` class that repsonds to the following interaction pattern:

#
# samson.fed?
# # => false
#
# samson.feed
#
# samson.fed?
# # => true
# ```
