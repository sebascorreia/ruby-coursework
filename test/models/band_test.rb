require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test 'should not save empty band' do
    band =  Band.new

    band.save
    refute band.valid?
  end
  test 'should save valid band' do
    band = Band.new

    band.name = 'My Band'

    band.save
    assert band.valid?
  end

  test 'should not save duplicate band name' do
    band1 = Band.new
    band1.name= 'My Band'
    band1.save
    assert band1.valid?

    band2 = Band.new
    band2.name = 'My Band'
    band2.save
    refute band2.valid?
  end
end
