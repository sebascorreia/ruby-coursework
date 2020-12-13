json.extract! song, :id, :album_id, :name, :lyrics, :minutes, :seconds, :created_at, :updated_at
json.url song_url(song, format: :json)
