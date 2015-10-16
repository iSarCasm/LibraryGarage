class Author
  attr_accessor :name, :genre, :bornDate, :country, :library
  attr_reader :books
  def initialize(name, bio = {})
    @name = name
    @genre = bio[:genre]
    @bornDate = bio[:bornDate]
    @country = bio[:country]
    @age = bio[:age]
    @books = []
  end

  def library=(lib)
    if @library != lib  # setting to new lib
      @library.authors.delete(self) if @library
      lib.authors << self
    end
    @library = lib
  end

  def to_s
    "\n#{super} \n\tName: #{@name}; \n\tBooks: #{@books}"   # fancy
  end
  alias_method :inspect, :to_s

  def add_book book
    @books << book
  end

  def latest
    @books.sort{ |b| b.releaseDate }.last || @books.last
  end

  def best_book(n=1)
    r = @books.sort{ |a,b| a.popularity <=> b.popularity }.reverse.take(n)
    r.first if n == 1
  end

  def bestseller(n=1)
    if @library
      r = @library.book_top.select{|b| b.author == self}.take(n)   # yup
      r.first if n == 1
    end
  end
end
