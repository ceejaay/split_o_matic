This has three parts

First: 285games.txt. I wanted to take the text from this file turn it into strings and integers and put it in a SQLite database.
The text in the document looked like this:

  200: Name of Game: The sequel (Conosole, Year)

Second: string_parse.rb: So I wrote the method string_breakdown to break down each line of the text document into an array of hashes. I used a few regex's to break the strings up. I converted the lines of text into strings where I wanted strings. The names of games and consoles were strings. The number of the games and the year became integers.

Third: nintendo_games.db. This is a SQLite3 database with all the games listed in it. I wrote the string_breakdown method and loaded it into the irb. I also used the SQLite gem. I used these tools to convert the text file into a database.
