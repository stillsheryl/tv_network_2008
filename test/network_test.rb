require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test

  def test_it_exists
    nbc = Network.new("NBC")

    assert_instance_of  Network, nbc
  end

  def test_it_has_no_shows_by_default
    nbc = Network.new("NBC")

    assert_equal [], nbc.shows
  end

end
