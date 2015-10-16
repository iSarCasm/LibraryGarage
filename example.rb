require_relative 'library/library'
require_relative 'load_data'

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
load_data
# API demonstration
lib = Library.load "MyLib.txt"
puts "【・_・?】"
puts "Bestseller #{lib.bestseller.to_s}"
puts "Mainstream = #{lib.mainstream.size} dudes: #{lib.mainstream}"
puts "Book top: #{lib.book_top()}"
# author api
puts "\n(∗ ･‿･)ﾉ゛"
puts "Martin's books: #{lib.author('George R. R. Martin').books}"
puts "Martin's bestseller: #{lib.author('George R. R. Martin').bestseller}"
puts "Martin's best book: #{lib.author('George R. R. Martin').best_book}"
puts "Martin's last book: #{lib.author('George R. R. Martin').latest}"

# book api
puts "\nヽ(#`Д´)ﾉ"
puts "Fans of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").fans}"
puts "Orders of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").orders}"
puts "Readers of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").readers}"
puts "Popularity of book 'A game of Thrones': #{lib.find_book("A Game of Thrones").popularity}"
puts "\n"

# reader api
puts "Σ(ﾟДﾟ? )ﾉ"
puts "Tywin Lannister's orders: #{lib.reader('Tywin Lannister').orders}"
puts "\n"

# order api
puts "( ﹡ﾟーﾟ﹡)"
puts "Orders similar to John Doe's first order: #{lib.reader('John Doe').orders[0].similar}"

puts "
       ____
  _||__|  |  ______   ______   ______
 (        | |      | |      | |      |
 /-()---() ~ ()--() ~ ()--() ~ ()--()
lib.bestseller.author.bestseller.fans.first.orders.last.book.author.latest.readers: #{lib.bestseller.author.bestseller.fans.first.orders.last.book.author.latest.readers}\n\n"   # you can do this



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
  k = '"Now try yourself (\'exit\' or \'save\'):"'
  line = 0
  b = binding
  until k == 'exit' || k == "save"
    b.eval "puts #{k}"
    print "#{RUBY_VERSION} :#{line.to_s.rjust(3,'0')} > "
    k = gets.chomp
    line+=1
  end
  lib.save "newLib.txt"  if k == "save"
end
try_myself.call
