require_relative 'library'

puts'Library App for RubyGarage
      _.--._  _.--._
,-=.-":;:;:;\':;:;:;"-._
\\\:;:;:;:;:;\:;:;:;:;:;\
 \\\:;:;:;:;:;\:;:;:;:;:;\
  \\\:;:;:;:;:;\:;:;:;:;:;\
   \\\:;:;:;:;:;\:;::;:;:;:\
    \\\;:;::;:;:;\:;:;:;::;:\
     \\\;;:;:_:--:\:_:--:_;:;\
      \\\_.-"      :      "-._\
       \`_..--""--.;.--""--.._=>
        "
'
# New library
library  = Library.new('GarageLibrary')
# Readers
library.add_reader Reader.new("John Doe", "doe@doe.doe", "Springfield", "Doe st.", "13", age: 37)
library.add_reader Reader.new("Michael Bay", "thebest@dude.com",  "NY", "Doe st.", "34", gender: "dude")
library.add_reader Reader.new("Madonna", "mdn@talented.net","LA", "Doe st.", "42")
library.add_reader Reader.new("Tywin Lannister", "tywin@lannister.ucoz.ru","Casterly Rock", "Town hall", "14", age: 88)
# Authors
rothfuss      =  library.add_author Author.new("Patrick Rothfuss", age: 42, genre: "Fantasy")
martin        =  library.add_author Author.new("George R. R. Martin")
                 library.add_author Author.new("J. R. R. Tolkien")
someAuthor    =  library.add_author Author.new("E. L. James", genre: "Erotic romance")
# Books
library.add_book Book.new("A Game of Thrones", martin, date: 1996)
library.add_book Book.new("A Clash of Kings", "George R. R. Martin", date: 1998)
library.add_book Book.new("A Storm of Swords", "George R. R. Martin", date: 2000)
library.add_book Book.new("A Feast for Crows", "George R. R. Martin", date: 2005, pages: 666)
library.add_book Book.new("A Dance with Dragons", "George R. R. Martin")
library.add_book Book.new("The Winds of Winter", "George R. R. Martin", date: 2045, hype: 9000)
library.add_book Book.new("The Hobbit", "J. R. R. Tolkien")
library.add_book Book.new("The Fellowship of the Ring", "J. R. R. Tolkien")
library.add_book Book.new("The Name of the Wind", rothfuss)
library.add_book Book.new("The Wise Man's Fear ", "Patrick Rothfuss")
library.add_book Book.new("50 Shades of Depression", someAuthor)
# Make some orders
library.order("John Doe", "A Game of Thrones")
library.order("John Doe", "A Feast for Crows")
library.order("John Doe", "50 Shades of Depression")
library.order("John Doe", "A Game of Thrones")
library.order("Michael Bay", "A Game of Thrones")
library.order("Michael Bay", "A Feast for Crows")
library.order("Michael Bay", "50 Shades of Depression")
library.order("Madonna", "A Feast for Crows")
library.order("Madonna", "50 Shades of Depression")
library.order("Madonna", "50 Shades of Depression")
library.order("Tywin Lannister", "The Winds of Winter")
library.order("Tywin Lannister", "The Wise Man's Fear")
# Save
library.save "MyLib.txt"


# More API demonstration
lib = Library.load "MyLib.txt"
# library api
puts "Bestseller #{lib.bestseller.to_s}"
puts "\nBook top: #{lib.book_top()}"
puts "\nMainstream ppl: #{lib.mainstream_count} dudes: #{lib.mainstream}"
puts "\n"
# author api
puts "\nMartin's books: #{lib.author('George R. R. Martin').books}"
puts "\nMartin's bestseller: #{lib.author('George R. R. Martin').bestseller}"
puts "\nMartin's best book: #{lib.author('George R. R. Martin').best_book}"
puts "\n"
# book api
puts "\nFans of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").fans}"
puts "\nOrders of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").orders}"
puts "\nReaders of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").readers}"
puts "\nPopularity of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").popularity}"
puts "\n"

# reader api
puts "\nTywin Lannister's orders: #{lib.reader('Tywin Lannister').orders}"
puts "\n"

# order api
puts "\nOrders similar to John Doe's first order: #{lib.reader('John Doe').orders[0].similar}"
puts "\n"

puts "#{lib.bestseller.author.bestseller.fans.first.orders.last.book.author.best_book.readers}"   # you can do this



 #                                           $"   *.
 #               d$$$$$$$P"                  $    J
 #                   ^$.                     4r  "
 #                   d"b                    .db
 #                  P   $                  e" $
 #         ..ec.. ."     *.              zP   $.zec..
 #     .^        3*b.     *.           .P" .@"4F      "4
 #   ."         d"  ^b.    *c        .$"  d"   $         %
 #  /          P      $.    "c      d"   @     3r         3
 # 4        .eE........$r===e$$$$eeP    J       *..        b
 # $       $$$$$       $   4$$$$$$$     F       d$$$.      4
 # $       $$$$$       $   4$$$$$$$     L       *$$$"      4
 # 4         "      ""3P ===$$$$$$"     3                  P
 #  *                 $       """        b                J
 #   ".             .P                    %.             @
 #     %.         z*"                      ^%.        .r"
 #        "*==*""                             ^"*==*""   My version of IRB here:
try_myself = Proc.new do
  k = '"Now try yourself (\'exit\'):"'
  line = 0
  b = binding
  until k == 'exit'
    b.eval "puts #{k}"
    print "#{RUBY_VERSION} :#{line.to_s.rjust(3,'0')} > "
    k = gets.chomp
    line+=1
  end
end
try_myself.call
