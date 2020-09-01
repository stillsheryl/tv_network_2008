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
    shows_hash = Hash.new
    @shows.each do |show|
      show.characters.each do |character|
        if shows_hash[show].nil?
          shows_hash[show] = [character.actor]
        else
          shows_hash[show] << character.actor
        end
      end
    end
    shows_hash
  end

end
