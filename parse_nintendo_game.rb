def parse_nintendo_game(line)
  /^
  \d+:\s+           # preamble
  (?<title>.+)      # title
  \s+
  \(
  (?<console>[^,]+) # console
  ,?\s+
  (?<year>[^)]+)    # release year(s)
  \)/x =~ line

  consoles = console.split('/')
  years    = year.split('/').map(&:to_i)

  { title: title, consoles: consoles, years: years }
end
