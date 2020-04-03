class Groomer

  attr_reader :name, :customers, :charges
  def initialize(name)
    @name = name
    @customers = []
    @charges = []
  end

  def new_customer(customer)
    @customers << customer
  end

  def customers_with_oustanding_balance
    @customers.find_all {|customer| customer.outstanding_balance != 0}
  end

  def all_pets
    @customers.map {|customer| customer.pets}.flatten
  end

  def pets_by_type(type)
    all_pets.count {|pet| pet.type == type}
  end

  def charge_customer(customer_name, invoice_number, invoice_amount, service, pet)
    @charges << ["#{invoice_number}" => {customer_name: customer_name.name, invoice_amount: invoice_amount, service: service, pet: pet}]
  end
end


## Iteration 4

# # The pet grooming company would like to be able to track
# more information on charges. They want to be able to track
# what the charge was for, for example washing, hair cut, etc.
# They also want to know which customer the charge applies to,
# which pet the charge applies to, and the amount of the charge.
