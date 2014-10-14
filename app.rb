# app.rb
# Intouch Marsvongpragorn 	5631371921
# Benjaporn Pianpanitporn 	5631270121
# Thanatseth Howattanapan 	5631254121
# Nuntuchaporn Trongsiriwat 5631267321 
require 'rspec'
require "./lib/game.rb"

game = Game.new()
game.roll(0)
game.roll(7)
game.roll(2)
game.roll(6)
game.roll(4)
game.roll(5)
game.roll(2)
game.roll(7)
game.roll(3)
game.roll(7)
game.roll(4)
game.roll(6)
game.roll(10)
game.roll(5)
game.roll(5)
game.roll(3)
game.roll(7)
game.roll(8)
game.roll(1)

total_score = game.score()
puts "Total Score: #{total_score}"