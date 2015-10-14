class Reader
  attr_accessor :name, :email, :city, :street, :house, :library
  def initialize (name, email, city, street, house, bio = {})
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    @age = bio[:age]
    @gender = bio[:gender]
  end

  def library=(lib)
    if @library != lib  # setting to new lib
      @library.readers.delete(self) if @library
      lib.readers << self
    end
    @library = lib
  end

  def to_s
    "#{@name}"
  end
  alias_method :inspect, :to_s

  def order book
    @library.order(book,self)
  end

  def orders
    @library.orders.select{ |o| o.reader == self }
  end
end
