require 'minitest/autorun'
require_relative 'parse_nintendo_game'

class TestParseNintendoGame < MiniTest::Unit::TestCase
  def test_parse_simple_title
    parsed = parse_nintendo_game("285: Super Star Wars (SNES, 1992)")
    assert_equal "Super Star Wars", parsed[:title]
  end

  def test_parse_title_with_parens
    parsed = parse_nintendo_game("4: Final Fantasy III (VI) (SNES, 1994)")
    assert_equal "Final Fantasy III (VI)", parsed[:title]
  end

  def test_parse_consoles
    parsed = parse_nintendo_game("285: Super Star Wars (SNES, 1992)")
    assert_equal ["SNES"], parsed[:consoles]
  end

  def test_parse_multiple_consoles
    parsed = parse_nintendo_game("76: Sin and Punishment (Wii Virtual Console/N64, 2007/2000)")
    assert_equal ["Wii Virtual Console", "N64"], parsed[:consoles]
  end

  def test_parse_years
    parsed = parse_nintendo_game("285: Super Star Wars (SNES, 1992)")
    assert_equal [1992], parsed[:years]
  end

  def test_parse_multiple_years
    parsed = parse_nintendo_game("76: Sin and Punishment (Wii Virtual Console/N64, 2007/2000)")
    assert_equal [2007, 2000], parsed[:years]
  end

  def test_parse_consoles_and_years_without_comma_separator
    parsed = parse_nintendo_game("261: Super Mario Land 2: 6 Golden Coins (GameBoy 1992)")
    assert_equal ["GameBoy"], parsed[:consoles]
    assert_equal [1992], parsed[:years]
  end

  def test_parse_data_with_extra_cruft
    parsed = parse_nintendo_game("59: Star Fox 64 (N64, 1997) - Do a barrel roll!")
    assert_equal "Star Fox 64", parsed[:title]
    assert_equal ["N64"], parsed[:consoles]
    assert_equal [1997], parsed[:years]
  end
end
