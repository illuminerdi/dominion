require "test/unit"
require "dominion"

class TestDominion < Test::Unit::TestCase

  def setup
    @d = Dominion.new
  end

  def test_new_dominion_creates_three_player_game_with_base_set
    assert_equal 3, @d.players
    assert_equal 1, @d.sets.size
    assert_equal :base, @d.sets.first
  end

  def test_available_sets_shows_remaining_unused_sets
    assert_equal 6, @d.available_sets.size
  end

  def test_we_have_all_expected_sets
    expected = [:base, :intrigue, :seaside, :alchemy, :prosperity, :cornucopia, :promo]
    assert_equal expected, Dominion::CURRENT_SETS
  end

  def test_add_new_set_adds_new_set
    @d.add_set :seaside
    assert_equal 2, @d.sets.size
    assert @d.sets.include?(:seaside), "Sets didn't include :seaside"
  end

  def test_add_existing_set_does_not_add_new_set
    @d.add_set :base
    assert_equal 1, @d.sets.size
  end

  def test_add_set_that_does_not_exist_throws_exception
    assert_raises(DominionError) {
      begin
        @d.add_set :foobar
      rescue DominionError => de
        assert_match "Attempted to add nonexistent set: #{:foobar}", de.message
        raise de
      end
    }
  end

  def test_less_than_2_players_throws_exception
    assert_raises(DominionError) {
      begin
        Dominion.new 1
      rescue DominionError => de
        assert_match /Dominion requires between 2-6 players/, de.message
        raise de
      end
    }
  end

  def test_more_than_6_players_throws_exception
    assert_raises(DominionError) {
      begin
        Dominion.new 7
      rescue DominionError => de
        assert_match /Dominion requires between 2-6 players/, de.message
        raise de
      end
    }
  end

  def test_2_players_accepted
    assert_nothing_raised {
      Dominion.new 2
    }
  end

  def test_6_players_accepted
    assert_nothing_raised {
      Dominion.new 6
    }
  end

  def test_generate_supply
    foo = @d.generate_supply
    assert foo.instance_of? Supply
  end
end
