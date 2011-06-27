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

  def test_expected_file_name
    assert_equal "data/#{:prosperity}.yaml", @cs.file_name
  end

  def test_save_throws_no_exception
    assert_nothing_raised {
      @cs.save
    }
  end

  def test_load_from_file_reloads_all_cards
    @cs.load_from_file
    assert @cs.cards.size > 0, "Expected card set to have been reloaded."
  end
end