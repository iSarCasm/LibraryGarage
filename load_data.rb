def load_data
  # New library
  library  = Library.new('GarageLibrary')
  # Readers
  library.add_reader  Reader.new("John Doe", "doe@doe.doe", "Springfield", "Doe st.", "13", age: 37)
  reader =            Reader.new("Michael Bay", "thebest@dude.com",  "NY", "Doe st.", "34", gender: "dude"); reader.library = library
  library.add_reader  Reader.new("Madonna", "mdn@talented.net","LA", "Doe st.", "42")
  library.add_reader  Reader.new("Tywin Lannister", "tywin@lannister.ucoz.ru","Casterly Rock", "Town hall", "14", age: 88)
  # Authors
  rothfuss      =  library.add_author Author.new("Patrick Rothfuss", age: 42, genre: "Fantasy")
  martin        =  Author.new("George R. R. Martin"); martin.library = library
                   library.add_author Author.new("J. R. R. Tolkien")
  someAuthor    =  library.add_author Author.new("E. L. James", genre: "Erotic romance")
  # Books
  library.add_book  Book.new("The Winds of Winter", "George R. R. Martin", date: 2045, hype: 9000)
  thrones       =   Book.new("A Game of Thrones", martin, date: 1996); thrones.library = library
  library.add_book  Book.new("A Clash of Kings", "George R. R. Martin", date: 1998)
  library.add_book  Book.new("A Storm of Swords", "George R. R. Martin", date: 2000)
  library.add_book  Book.new("A Feast for Crows", "George R. R. Martin", date: 2005, pages: 666)
  library.add_book  Book.new("A Dance with Dragons", "George R. R. Martin")
  library.add_book  Book.new("The Hobbit", "J. R. R. Tolkien")
  library.add_book  Book.new("The Fellowship of the Ring", "J. R. R. Tolkien")
  library.add_book  Book.new("The Name of the Wind", rothfuss)
  library.add_book  Book.new("The Wise Man's Fear ", "Patrick Rothfuss")
  library.add_book  Book.new("50 Shades of Depression", someAuthor)
  # Make some orders
  library.make_order("John Doe", "A Game of Thrones")
  library.make_order("John Doe", "A Feast for Crows")
  library.make_order("John Doe", "50 Shades of Depression")
  library.make_order("John Doe", "A Game of Thrones")
  reader.make_order (thrones)
  library.make_order("Michael Bay", "A Feast for Crows")
  library.make_order("Michael Bay", "50 Shades of Depression")
  library.make_order("Madonna", "A Feast for Crows")
  library.make_order("Madonna", "50 Shades of Depression")
  library.make_order("Madonna", "50 Shades of Depression")
  library.make_order("Tywin Lannister", "The Winds of Winter")
  library.make_order("Tywin Lannister", "The Wise Man's Fear")
  # Save
  library.save "MyLib.txt"
end
