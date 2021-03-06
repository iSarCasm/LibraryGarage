require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'

class Library
  attr_accessor :name, :books, :orders, :readers, :authors
  def initialize (name, books: [], orders: [], readers: [], authors: [])
    @name = name
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def to_s
    "#{@name}"
  end

  def find_book book
    @books.select{|b| b.title == book}.first || book
  end
  alias_method :book, :find_book

  def find_author author
    @authors.select{|a| a.name == author }.first || author
  end
  alias_method :author, :find_author

  def find_reader reader
    @readers.select{|r| r.name == reader }.first || reader
  end
  alias_method :reader, :find_reader


  def add_book book
    book.author = find_author book.author
    unless @books.include?(book)  # setting to new lib
      book.author.add_book book
      @books << book
    end
    book.library = self # assign new library (me)
    return book
  end
  def add_author author
    unless @authors.include?(author)  # setting to new lib
      @authors << author
    end
    author.library = self
    return author
  end
  def add_reader reader
    unless @readers.include?(reader)  # setting to new lib
      @readers << reader
    end
    reader.library = self
    return reader
  end
  def add_order order
    unless @orders.include?(order)  # setting to new lib
      @orders << order
    end
    order.library = self
    return order
  end


  def make_order(reader,book)
    reader = find_reader reader
    book = find_book book
    add_order Order.new(book, reader, Time.now)
  end


  # What is the most popular book
  def bestseller
    book_top(1)
  end

  def book_top(n=0)
    top = @books.sort do |a,b|
      orders.select { |o| o.book == a }.size <=> orders.select { |o| o.book == b}.size
    end.reverse!
    if n > 1
      top.take(n)
    elsif n == 1
      top.first
    else
      top
    end
  end

  # How many people ordered one of the three most popular books
  def mainstream
    main_books = book_top(3)
    @orders.select{|o| main_books.include?(o.book)}.map{|o| o.reader}.uniq
  end


  def save(path)
    File.open(path,'wb') do |file|
      file.write Marshal.dump(self)
    end
  end

  def load(path)
    self.class.load(path)
  end
  def self.load(path)
    Marshal.load File.open(path,'rb').read
  end

end
