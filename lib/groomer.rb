class Groomer

  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def new_customer(customer)
    @customers << customer
  end

  def customers_with_oustanding_balance
    @customers.find_all {|customer| customer.outstanding_balance > 0}
  end
end

# ## Iteration 3
#
# You have been contracted to build a software application for a pet grooming company. This company has many grooming centers and would like to be able to track data on each one of them. Specifically, they would like you to implement the following features:
#
# * Each Groomer has a unique name, as well as a way to read that data.
# * Each Groomer has multiple customers, and each of those customers can have multiple pets.
# * A Groomer can find all the customers with outstanding balances.
# * A Groomer can count the number of pets of a given type. For example the groomer can count the number of cats, the number of dogs, etc. This should work for any pet type.
#
# Build upon your code from the first two iterations to complete this task.
