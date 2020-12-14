require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:one)
    @album = albums(:one)
    @band = bands(:one)
  end

  test "should get index" do
    get band_album_songs_path(@album.band_id, @album)
    assert_response :success
  end

  test "should get new" do
    get new_band_album_song_path(@album.band_id, @album)
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post band_album_songs_path(@album.band_id, @album), params: { song: { album_id: @song.album_id, lyrics: @song.lyrics, minutes: @song.minutes, name: @song.name, seconds: @song.seconds } }
    end

    assert_redirected_to band_album_songs_path(@album.band_id, @album)
  end

  test "should show song" do #Also works in practice but doesnt work in testing, but
    get song_path(@song)#doesnt recognize @song.band.name
    assert_response :success
  end

  test "should get edit" do
    get edit_band_album_song_path(@band.id,@album.id,@song.id)
    assert_response :success
  end

  test "should update song" do
    patch band_album_song_path(@band,@album,@song), params: { song: { album_id: @song.album_id, lyrics: @song.lyrics, minutes: @song.minutes, name: @song.name, seconds: @song.seconds } }
    assert_redirected_to band_album_songs_path(@album.band_id, @album)
  end

  test "should destroy song" do #doesnt recognize @song.band.id would have to change a lot for it to work, but it works on the actual controller.
    assert_difference('Song.count', -1) do
      delete song_path(@song)
    end

    assert_redirected_to band_album_songs_path(@band, @album)
  end
end
