gem 'minitest'
require './lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/scrabble'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_it_can_score_a_single_letter
    game = GameReader.new('hello')
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

end
