#breaking up a string so It can go into a database.


class StringToDatabase

  def string_breakdown
    hash = Hash.new
    string_number, string_year = '', ''
    #string_year = ''
    string_year, string_number = self.slice!(/\d{4}/), self.slice!(/\A\d+/)
    hash[:year], hash[:number] = string_year.to_i, string_number.to_i
    self.slice!(/:{1}/)
    #string_number = self.slice!(/\A\d+/)
    #hash[:number] = string_number.to_i
    self.slice!("(")
    self.slice!(")")
    self.slice!(",")
    hash[:console] = self.slice!(/GBA|NES|SNES|GameCube|DS|Wii|N64|3DS|DSiWare|GameBoy|GameBoy Color|DSiWare|Virtual Console/ )
    #confine the left and right strip! whitespace to one line.
    self.lstrip!.rstrip!
    hash[:title] = self 

    return hash
  end



end #end of string class.
