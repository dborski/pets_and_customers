class Pet

  attr_reader :name, :type, :age
  def initialize(init_hash)
    @name = init_hash[:name]
    @type = init_hash[:type]
    @age = init_hash[:age]
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end
end
