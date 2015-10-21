class Order
  attr_reader :book, :reader, :date
  attr_accessor :library
  def initialize (book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  def library=(lib)
    if @library != lib                            # setting to new lib
      @library.orders.delete(self) if @library    # delete me from previous lib
      @library = lib
      @library.add_order self                     # add to new lib
    end
  end

  def to_s
    "#{super}: #{@reader} ordered #{@book} [#{@date}]"
  end
  alias_method :inspect, :to_s

  def similar
    if @library
      @library.orders.select {|o| o.book == @book && o.reader == @reader }
    end
  end

end
