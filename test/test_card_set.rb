require "test/unit"
require "dominion"

class TestCardSet < Test::Unit::TestCase

  def setup
    @cs = CardSet.new(:prosperity)
  end

  def test_card_set_has_cards
    assert @cs.cards.size > 0, "Expected card set to have at least 1 card in it."
  end

  def test_card_set_has_set_given
    assert_equal :prosperity, @cs.set
  end
end