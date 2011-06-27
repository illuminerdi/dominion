require 'dominion'

class Card
  attr_accessor :title, :cost, :set, :type, :potion

  TYPES = [:action, :attack, :duration, :reaction, :treasure, :victory]

  def initialize(title, h={})
    @title = title
    @cost = h[:cost] || 0
    @type = []
    @potion = h[:potion] || false
    check_type(h[:type])
    check_set(h[:set])
  end

  def check_type(type)
    raise DominionError.new("Card must have a type") if (type.nil?)
    unless type.instance_of? Array
      type = [type]
    end
    type.each {|t|
      raise DominionError.new("Unknown card type #{t}") unless TYPES.include?(t)
      @type << t unless @type.include?(t)
    }
  end

  def check_set(set)
    raise DominionError.new("Unknown set #{set}") if (set.nil? || !Dominion::CURRENT_SETS.include?(set))
    @set = set
  end
end