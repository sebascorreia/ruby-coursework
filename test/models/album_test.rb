require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @band = bands(:one)
  end
  test 'should not save empty album' do
    album = Album.new

    album.save
    refute album.valid?
  end

  test 'should save valid album' do
  album = Album.new
  album.name = 'My Album'
  album.band = @band
  album.save

  assert album.valid?
  end
end
