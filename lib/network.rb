class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.map do |show|
      show.characters.find_all do |character|
        (character.salary > 500_000) && (character.name == character.name.upcase)
      end
    end.flatten
  end

  def actors_by_show
    actors_by_show_hash = Hash.new
    @shows.each do |show|
      show.characters.each do |character|
        if actors_by_show_hash[show].nil?
          actors_by_show_hash[show] = [character.actor]
        else
          actors_by_show_hash[show] << character.actor
        end
      end
    end
    actors_by_show_hash
  end

  def shows_by_actor
    shows_by_actor_hash = Hash.new
    @shows.each do |show|
      show.characters.each do |character|
        if shows_by_actor_hash[character.actor].nil?
          shows_by_actor_hash[character.actor] = [show]
        else
          shows_by_actor_hash[character.actor] << show
        end
      end
    end
    shows_by_actor_hash
  end

  def prolific_actors
    @shows.each do |show|
      show.characters.find_all do |character|
        # require "pry"; binding.pry
        shows_by_actor[character.actor].count >= 2
        character.actor
      end
    end
  end

end
