require 'dominion'

class CardSet

  attr_accessor :cards, :set

  def initialize(set)
    check_set(set)
    @cards = []
  end

  def check_set(set)
    raise DominionError.new("Must provide a set") if set.nil?
    raise DominionError.new("Unknown set #{set}") unless Dominion::CURRENT_SETS.include?(set)
    @set = set
  end

  def save

  end

end