
require 'rubygems'
require 'dominion/card_set'
require 'dominion/card'

class Dominion
  VERSION = '1.0.0'

  attr_accessor :players, :sets

  CURRENT_SETS = [:base, :intrigue, :seaside, :alchemy, :prosperity, :cornucopia, :promo]

  def initialize(players=3, h={sets: [:base]})
    raise DominionError.new("Dominion requires between 2-6 players") unless (2..6).include?(players)
    @players = players
    @sets = []
    load_sets h[:sets]
  end

  def load_sets sets
    unless sets.nil?
      if !sets.instance_of? Array
        sets = [sets]
      end
      sets.each {|set|
        @sets << set if CURRENT_SETS.include? set
      }
    end
  end

  def add_set(set)
    raise DominionError.new("Attempted to add nonexistent set: #{set}") if !CURRENT_SETS.include?(set)
    @sets << set if !@sets.include?(set)
  end

  def available_sets
    CURRENT_SETS - @sets
  end
end

class DominionError < StandardError; end
