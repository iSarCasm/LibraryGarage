class Book
  attr_accessor :title, :releaseDate, :pages, :author, :library
  def initialize(title, author, details = {})
    @title = title
    @author = author
    @releaseDate = details[:date]
    @pages = details[:pages]
    @hype = details[:hype] || 1
  end

  def library=(lib)
    if @library != lib  # setting to new lib
      @library.books.delete(self) if @library
      lib.books << self
    end
    @library = lib
  end


  def to_s
    "'#{title}' by #{author.name}."  # o_o
  end
  alias_method :inspect, :to_s

  # Who often takes the book
  def fans(n = 3)
    if @library
      fans = @library.readers.sort do |a, b|
        orders.count{ |o| o.reader == a && o.book == self }.size <=> orders.count { |o| o.reader == b && o.book == self}
      end.reverse!
      fans.first(n)
    end
  end

  def orders
    if @library
      @library.orders.select{|o| o.book == self }
    end
  end

  def readers
    orders.map{|o| o.reader}.uniq
  end

  def popularity
    orders.size * @hype**0.5  # Much Math Very Formula
  end
end
