require 'dominion'
require 'yaml'

class CardSet

  attr_accessor :cards, :set

  def initialize(set)
    check_set(set)
    @cards = []
    load_from_file
  end

  def check_set(set)
    raise DominionError.new("Must provide a set") if set.nil?
    raise DominionError.new("Unknown set #{set}") unless Dominion::CURRENT_SETS.include?(set)
    @set = set
  end

  def file_name
    "data/#{@set}.yaml"
  end

  def save
    File.open(file_name, 'w') {|out|
      YAML.dump(self, out)
    }
  end

  def sort_cards
    @cards.sort_by!{|a| [a.cost, a.title]}
  end

  def load_from_file
    new_card_set = nil
    if File.exists?(file_name)
      File.open(file_name, 'r') {|yf|
        new_card_set = YAML.load(yf)
      }
      unless new_card_set.nil?
        check_set(new_card_set.set)
        @cards = new_card_set.cards
      end
    end
  end

end