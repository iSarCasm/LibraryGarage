class Reader
  attr_accessor :name, :email, :city, :street, :house, :library
  def initialize (name, email, city, street, house, age: nil, gender: nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    @age = age
    @gender = gender
  end

  def library=(lib)
    if @library != lib                          # setting to new lib
      @library.readers.delete(self) if @library # delete me from previous lib
      @library = lib
      @library.add_reader self                    # add to new lib
    end
  end

  def to_s
    "#{@name}"
  end
  alias_method :inspect, :to_s

  def make_order book
    if @library
      @library.make_order(self,book)
    end
  end

  def orders
    if @library
      @library.orders.select{ |o| o.reader == self }
    end
  end
end
