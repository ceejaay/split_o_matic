require './games_parser'

parser = GamesParser.new('285games.txt')
games = parser.parse
puts games
