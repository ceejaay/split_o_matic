class GamesParser
  def initialize(filename)
    @file = File.open(filename, 'r')
    @games = Array.new
  end

  def parse
    @file.each_line do |line|
      @games << parse_line(line)
    end
    @games
  end

  def parse_line(line)
    matching = line.match(/^(\d*): (.*) \((.*), (\d*)\)/)
    return if matching.nil? or matching.length < 5 # we should ideally throw an exception

    game = Hash.new
    game[:number], game[:title], game[:consoles], game[:year] = matching[1], matching[2], matching[3].split(','), matching[4]
    game
  end
end

