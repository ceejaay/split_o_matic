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
    hash = Hash.new
    string_number = ''
    string_year = ''
    string_year = line.slice!(/\d{4}/)
    hash[:year] = string_year.to_i
    line.slice!(/:{1}/)
    string_number = line.slice!(/\A\d+/)
    hash[:number] = string_number.to_i
    line.slice!("(")
    line.slice!(")")
    line.slice!(",")
    hash[:console] = line.slice!(/GBA|NES|SNES|GameCube|DS|Wii|N64|3DS|DSiWare|GameBoy|GameBoy Color|DSiWare|Virtual Console/ )
    line.lstrip!
    line.rstrip!
    hash[:title] = line
    hash
  end
end

