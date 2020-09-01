require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'

class ShowTest < Minitest::Test

  def test_it_exists
    show = Show.new

    assert_instance_of Show, show
  end

end
