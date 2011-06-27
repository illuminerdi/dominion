require "test/unit"
require "dominion"

class TestCard < Test::Unit::TestCase

  def setup
    @pawn = Card.new "Pawn", set: :intrigue, cost: 2, type: :action
    @nobles = Card.new "Nobles", set: :intrigue, cost: 6, type: [:action, :victory]
  end

  def test_card_has_expected_set_of_types
    expected = [:action, :attack, :duration, :reaction, :treasure, :victory]
    assert_equal expected, Card::TYPES
  end

  def test_card_has_title_we_give_it
    assert_equal "Pawn", @pawn.title
  end

  def test_title_is_required
    c = Card.new nil, set: :intrigue, cost: 2, type: :action
  end

  def test_card_has_set_we_give_it
    assert_equal :intrigue, @pawn.set
  end

  def test_card_with_bad_set_throws_exception
    assert_raises(DominionError) {
      begin
        c = Card.new "Smithy", :set => :foobar, :cost => 4, :type => :action
      rescue DominionError => de
        assert_match /Unknown set foobar/, de.message
        raise de
      end
    }
  end

  def test_card_with_bad_type_throws_exception
    assert_raises(DominionError) {
      begin
        c = Card.new "Smithy", :set => :base, :cost => 4, :type => :slap
      rescue DominionError => de
        assert_match /Unknown card type slap/, de.message
        raise de
      end
    }
  end

  def test_card_with_no_type
    assert_raises(DominionError) {
      begin
        c = Card.new "Smithy", set: :base, cost: 4
      rescue DominionError => de
        assert_match /Card must have a type/, de.message
        raise de
      end
    }
  end

  def test_card_with_multiple_types
    assert_equal 2, @nobles.type.size
    assert_equal [:action, :victory], @nobles.type
  end

  def test_card_with_potion_cost
    transmute = Card.new "Transmute", set: :alchemy, cost: 0, potion: true, type: :action
    assert transmute.potion
  end

  def test_card_without_potion_defaults_to_false
    assert !@pawn.potion
  end
end