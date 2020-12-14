require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album = albums(:one)
    @band = bands(:one)
  end

  test "should get index" do
    get band_albums_path(@band,@album)
    assert_response :success
  end

  test "should get new" do
    get new_band_album_path(@band)
    assert_response :success
  end

  test "should create album" do
    #puts @band.inspect
    #puts @album.inspect
    assert_difference('Album.count') do
      post new_band_album_path(@band), params: { album: { band_id: @band.id, name: @album.name, year: @album.year } }
    end

    assert_redirected_to band_albums_path(@band)
  end

  test "should show album" do #Works fine in practice but the test for some reason
    get band_album_songs_path(@band,@album)#does not recognize first line of song index
    assert_response :success
  end

  test "should get edit" do
    get edit_band_album_path(@album.band_id,@album)
    assert_response :success
  end

  test "should update album" do
    patch album_path(@album), params: { album: { band_id: @band.id, name: @album.name, year: @album.year } }
    assert_redirected_to band_albums_path(@band)
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete album_path(@album)
    end

    assert_redirected_to band_albums_path(@band)
  end
end
