#breaking up a string so It can go into a database.


class String

  def string_breakdown
    hash = Hash.new
    string_number = ''
    string_year = ''
    string_year = self.slice!(/\d{4}/)
    hash[:year] = string_year.to_i
    self.slice!(/:{1}/)
    string_number = self.slice!(/\A\d+/)
    hash[:number] = string_number.to_i
    self.slice!("(")
    self.slice!(")")
    self.slice!(",")
    hash[:console] = self.slice!(/GBA|NES|SNES|GameCube|DS|Wii|N64|3DS|DSiWare|GameBoy|GameBoy Color|DSiWare|Virtual Console/ )
    self.lstrip!
    self.rstrip!
    hash[:title] = self 

    return hash
  end



end #end of string class.
