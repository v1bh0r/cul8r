require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Movie.new.valid?
  end
end
