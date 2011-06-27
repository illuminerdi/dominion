= dominion

* http://illuminerdi.com
* http://riograndegames.com/games.html?id=278

== DESCRIPTION:

A ruby library for organizing all Dominion Kingdom Cards and generating Kingdom Supplies for a game of Dominion.

== FEATURES/PROBLEMS:

* Contains all cards from Base set through Cornucopia
* Can generate a random set of 10 kingdom cards, obeying all of the rules for drafting sets
* Options include removing whole sets, specific cards from rotation
* Options include marking a just-played set with a 'cooldown' period to avoid running into the same cards on the next set
* Generating a new set of cards will indicate all setup steps needed to get the game started

== SYNOPSIS:

  >> d = Dominion.new 3, :sets => [:base, :prosperity]
  => #<Dominion:0x787274 @players=3, @sets=[:base, :prosperity]>
  >> d.add_set :alchemy
  => [:base, :prosperity, :alchemy]
  >> d.remove_card :possession
  => nil
  >> d.card_allowed? :possession
  => false
  >> d.card_allowed? :pawn
  => false
  >> d.card_allowed? :smithy
  => true
  >> d.generate_supply
  => Supply:
     loan (cost: 3, type: treasure)
     smithy (cost: 4, type: action)
     [...]

== REQUIREMENTS:

* ruby 1.9.2

== INSTALL:

* gem install dominion

== LICENSE:

(The MIT License)

Copyright (c) 2011 Joshua Clingenpeel

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
