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

end
