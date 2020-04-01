class Customer

  attr_reader :name, :id, :pets, :outstanding_balance
  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balance = 0
  end

  def adopt(pet)
    @pets << pet
  end

  def charge(invoice_amount)
    @outstanding_balance += invoice_amount
  end
end
